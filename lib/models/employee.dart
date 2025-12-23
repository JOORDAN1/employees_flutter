import 'package:employees/models/project.dart';

class Employee {
  final int Id;
  final String FirstName;
  final String LastName;
  final String Email;

  const Employee({
    required this.Id,
    required this.FirstName,
    required this.LastName,
    required this.Email
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    Id: json['id'],
    FirstName: json['firstName'],
    LastName: json['lastName'],
    Email: json['email']
  );

  Map<String, dynamic> toJson() =>
      {
        "id": Id,
        "firstName": FirstName,
        "lastName" : LastName,
        "email" : Email
      };
}