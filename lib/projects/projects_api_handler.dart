import 'dart:convert';

import 'package:employees/models/job.dart';
import 'package:http/http.dart' as http;

import '../models/project.dart';

class ProjectApiHandler {
  final String baseUri = "http://localhost:5068/api/projects";

  Future<List<Project>> getProjectsData() async{
    List<Project> ProjectsData = [];

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
        ProjectsData = jsonData.map((json) => Project.fromJson(json)).toList();
      }

    } catch(e){
      print("Error fetching projects: $e");
    }
    return ProjectsData;
  }

  Future<Project?> getProjectData(int id) async{
    Project? projectData;

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
        projectData = Project.fromJson(jsonData);
      }

    } catch(e){
      print("Error fetching project: $e");
    }
    return projectData;
  }


  Future<http.Response> updateProject({required Project project, required int id}) async {
    final uri = Uri.parse("$baseUri/$id");
    late http.Response response;

    try
    {
      response = await http.put(
          uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
          body: json.encode(project)
      );
    }catch(e){
      print("Error edit project $e");
    }

    return response;
  }

  Future<http.Response> addProject({required Project project}) async {
    final uri = Uri.parse("$baseUri");
    late http.Response response;

    try{
      response = await http.post(
          uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
          body: json.encode(project)
      );
    }catch(e){
      print("Error add project $e");
    }

    return response;
  }

  Future<http.Response> deleteProject({required int id}) async {
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
      print("Error delete project $e");
    }

    return response;
  }
}