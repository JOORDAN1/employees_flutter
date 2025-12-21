import 'dart:convert';

import 'package:employees/models/project.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUri = "http://localhost:5068/api/projects";

  Future<List<Project>> getProjectData() async{
    List<Project> ProjectsData = [];

    final uri = Uri.parse(baseUri);
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
}