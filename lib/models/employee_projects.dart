import 'package:employees/models/project.dart';

class EmployeeProjects {
  final int id;
  final int employeeId;
  final int projectId;

  const EmployeeProjects({
    required this.id,
    required this.employeeId,
    required this.projectId
  });

  factory EmployeeProjects.fromJson(Map<String, dynamic> json) => EmployeeProjects(
      id: json['id'],
      employeeId: json['employeeId'],
      projectId: json['projectId']
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "employeeId": employeeId,
        "projectId" : projectId
      };
}