

class ProjectEmployees {

  final String FirstName;
  final String LastName;

  const ProjectEmployees({
    required this.FirstName,
    required this.LastName,
  });

  factory ProjectEmployees.fromJson(Map<String, dynamic> json) => ProjectEmployees(
      FirstName: json['firstName'],
      LastName: json['lastName'],
  );
}

