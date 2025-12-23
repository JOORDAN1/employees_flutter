class Job {
  final int Id;
  final String Name;
  final String Description;

  const Job({
    required this.Id,
    required this.Name,
    required this.Description
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
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