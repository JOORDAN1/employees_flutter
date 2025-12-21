import 'dart:convert';

import 'package:employees/models/project.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUri = "http://localhost:5068/api";

  Future<List<Project>> getProjectData() async{
    List<Project> ProjectsData = [];

    final uri = Uri.parse("$baseUri/projects");
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

  Future<http.Response> updateProject({required Project project, required int id}) async {
    final uri = Uri.parse("$baseUri/projects/$id");
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
    final uri = Uri.parse("$baseUri/projects");
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
    final uri = Uri.parse("$baseUri/projects/$id");
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