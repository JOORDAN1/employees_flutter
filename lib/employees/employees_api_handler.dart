import 'dart:convert';

import 'package:employees/models/employee.dart';
import 'package:http/http.dart' as http;

class EmployeesApiHandler {
  final String baseUri = "http://localhost:5068/api/employees";

  Future<List<Employee>> getEmployeeData() async{
    List<Employee> EmployeesData = [];

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
        EmployeesData = jsonData.map((json) => Employee.fromJson(json)).toList();
      }

    } catch(e){
      print("Error fetching employees: $e");
    }
    return EmployeesData;
  }

  Future<http.Response> updateEmployee({required Employee employee, required int id}) async {
    final uri = Uri.parse("$baseUri/$id");
    late http.Response response;

    try
    {
      response = await http.put(
          uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
          body: json.encode(employee)
      );
    }catch(e){
      print("Error edit employee $e");
    }

    return response;
  }

  Future<http.Response> addEmployee({required Employee employee}) async {
    final uri = Uri.parse("$baseUri");
    late http.Response response;

    try{
      response = await http.post(
          uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
          body: json.encode(employee)
      );
    }catch(e){
      print("Error add employee $e");
    }

    return response;
  }

  Future<http.Response> deleteEmployee({required int id}) async {
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
      print("Error delete employee $e");
    }

    return response;
  }
}