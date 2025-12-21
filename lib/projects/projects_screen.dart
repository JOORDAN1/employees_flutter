import 'package:employees/Items/list_Button.dart';
import 'package:employees/Items/menu_button.dart';
import 'package:employees/api_handler.dart';
import 'package:employees/models/project.dart';
import 'package:employees/projects/edit_project_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsScreen extends StatefulWidget{

  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState()
  {
    return _ProjectScreenState();
  }



}

class _ProjectScreenState extends State<ProjectsScreen> {

  final ApiHandler apiHandler = ApiHandler();
  List<Project> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final result = await apiHandler.getProjectData();
    setState(() {
      data = result;
      isLoading = false;
    });
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      data[index].Name,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      data[index].Description,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.orange,
                          tooltip: 'Edit',
                          onPressed: () {
                            Navigator.push(context, 
                            MaterialPageRoute(
                                builder: (context) => EditProjectScreen(project: data[index], appBarText: "Edit ${data[index].Name}"))
                            );
                            print('Edit ${data[index].Name}');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          tooltip: 'Delete',
                          onPressed: () {
                            print('Delete ${data[index].Name}');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
        SizedBox(height: 20),
        ListButton(
          buttonText: "Add Project",
          onTap: () {},
        ),
      ],
    );
  }
}