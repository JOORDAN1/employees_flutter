import 'package:employees/models/employee.dart';

import 'employee.dart';

class Job {
  final int Id;
  final String Name;
  final String Description;
  // final Employee? employee;

  const Job({
    required this.Id,
    required this.Name,
    required this.Description,
    // this.employee
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    Id: json['id'],
    Name: json['name'],
    Description: json['description'],
      // employee: json['employee']
  );

  Map<String, dynamic> toJson() =>
      {
        "id": Id,
        "name": Name,
        "description" : Description,
        // "employee" : employee
      };
}