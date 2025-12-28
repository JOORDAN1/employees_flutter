

class ProjectEmployees {

  final int Id;
  final String FirstName;
  final String LastName;

  const ProjectEmployees({
    required this.Id,
    required this.FirstName,
    required this.LastName,
  });

  factory ProjectEmployees.fromJson(Map<String, dynamic> json) => ProjectEmployees(
      Id: json["id"],
      FirstName: json['firstName'],
      LastName: json['lastName'],
  );
}

