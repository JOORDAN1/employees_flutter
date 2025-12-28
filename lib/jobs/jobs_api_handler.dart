import 'dart:convert';

import 'package:employees/models/job.dart';
import 'package:http/http.dart' as http;


class JobsApiHandler {
  final String baseUri = "http://localhost:5068/api/jobs";

  Future<List<Job>> getJobsData() async{
    List<Job> JobsData = [];

    final uri = Uri.parse("$baseUri");
    try{
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if(response.statusCode >= 200 && response.statusCode <= 299)
      {
        final List<dynamic> jsonData = jsonDecode(response.body);
        JobsData = jsonData.map((json) => Job.fromJson(json)).toList();
      }

    } catch(e){
      print("Error fetching jobs: $e");
    }
    return JobsData;
  }

  Future<Job?> getJobData(int id) async{
    Job? jobsData;

    final uri = Uri.parse("$baseUri/$id");
    try{
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if(response.statusCode >= 200 && response.statusCode <= 299)
      {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        jobsData = Job.fromJson(jsonData);

      }

    } catch(e){
      print("Error fetching jobs: $e");
    }
    return jobsData;
  }

  Future<http.Response> updateJob({required Job job, required int id}) async {
    final uri = Uri.parse("$baseUri/$id");
    late http.Response response;

    try
    {
      response = await http.put(
          uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
          body: json.encode(job)
      );
    }catch(e){
      print("Error edit job $e");
    }

    return response;
  }

  Future<http.Response> addJob({required Job job}) async {
    final uri = Uri.parse("$baseUri");
    late http.Response response;

    try{
      response = await http.post(
          uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
          body: json.encode(job)
      );
    }catch(e){
      print("Error add job $e");
    }

    return response;
  }

  Future<http.Response> deleteJob({required int id}) async {
    final uri = Uri.parse("$baseUri/$id");
    late http.Response response;

    try{
      response = await http.delete(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
    }catch(e){
      print("Error delete job $e");
    }

    return response;
  }
}