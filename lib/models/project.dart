class Project {
  final int Id;
  final String Name;
  final String Description;

  const Project({
    required this.Id,
    required this.Name,
    required this.Description
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
      Id: json['id'],
      Name: json['name'],
      Description: json['description'],
  );

  Map<String, dynamic> toJson() =>
      {
        "id": Id,
        "name": Name,
        "description" : Description,

      };
}