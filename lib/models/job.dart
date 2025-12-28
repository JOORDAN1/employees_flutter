import 'package:employees/models/employee.dart';

import 'employee.dart';

class Job {
  final int Id;
  final String Name;
  final String Description;
  Employee? employee;
  int? employeeId;

  Job({
    required this.Id,
    required this.Name,
    required this.Description,
    this.employee,
    this.employeeId
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    Id: json['id'],
    Name: json['name'],
    Description: json['description'],
      employee: json['employee'] != null ? Employee.fromJson(json["employee"]) : null
  );

  Map<String, dynamic> toJson() =>
      {
        "id": Id,
        "name": Name,
        "description" : Description,
        "employeeId" : employeeId
      };
}