import 'package:employees/models/project_employees.dart';

import 'employee.dart';

class Project {
  final int Id;
  final String Name;
  final String Description;
  final List<ProjectEmployees>? Employees;

  const Project({
    required this.Id,
    required this.Name,
    required this.Description,
    this.Employees,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
      Id: json['id'],
      Name: json['name'],
      Description: json['description'],
      Employees: json['employees'] != null
        ? (json['employees'] as List)
          .map((e) => ProjectEmployees.fromJson(e))
          .toList()
        : null,
  );

  Map<String, dynamic> toJson() =>
      {
        "id": Id,
        "name": Name,
        "description" : Description,
      };
}