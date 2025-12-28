import 'package:employees/models/project.dart';

class Employee {
  final int Id;
  final String FirstName;
  final String LastName;
  final String? Email;
  final List<String>? ProjectNames;
  final List<String>? JobNames;

  const Employee({
    required this.Id,
    required this.FirstName,
    required this.LastName,
    this.Email,
    this.ProjectNames,
    this.JobNames
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    Id: json['id'],
    FirstName: json['firstName'],
    LastName: json['lastName'],
    Email: json['email'],
      ProjectNames: json['projectNames'] != null ? List<String>.from(json['projectNames']) : null,
      JobNames: json['jobNames'] != null ? List<String>.from(json['jobNames']) : null
  );

  Map<String, dynamic> toJson() =>
      {
        "id": Id,
        "firstName": FirstName,
        "lastName" : LastName,
        "email" : Email,
        "projectNames" : ProjectNames,
        "jobNames" : JobNames
      };
}