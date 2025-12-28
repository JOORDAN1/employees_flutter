import 'dart:convert';

import 'package:employees/models/employee.dart';
import 'package:employees/models/employee_projects.dart';
import 'package:employees/models/job.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



  class EmployeesNotInProjectApiHandler {
    final String baseUri = "http://localhost:5068/api";

    Future<List<Employee>> getEmployeesNotInProject(int projectId) async {

      List<Employee> employees = [];

      final uri = Uri.parse("$baseUri/employeesNotInProject/$projectId");
      try {
        final response = await http.get(
          uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
        );

        if (response.statusCode >= 200 && response.statusCode <= 299) {
          final List<dynamic> jsonData = jsonDecode(response.body);
          employees = jsonData.map((e) => Employee.fromJson(e)).toList();
        }
      } catch (e) {
        print("Error fetching projects: $e");
      }
      return employees;
    }


    Future<http.Response> addEmployeeProject({required EmployeeProjects employeeProjects}) async {
      final uri = Uri.parse("$baseUri/EmpPrj");
      late http.Response response;

      try{
        response = await http.post(
            uri,
            headers: <String, String>{
              'Content-type': 'application/json; charset=UTF-8'
            },
            body: json.encode(employeeProjects)
        );
      }catch(e){
        print("Error add employee to project $e");
      }

      return response;
    }

    Future<http.Response> deleteProject({required int empId, required int prjId}) async {
      final uri = Uri.parse("$baseUri/EmpPrj/$empId/$prjId");
      late http.Response response;

      try{
        response = await http.delete(
          uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
        );
      }catch(e){
        print("Error delete EmployeeProjects $e");
      }

      return response;
    }

  }