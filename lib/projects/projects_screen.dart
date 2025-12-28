import 'package:employees/Items/list_Button.dart';
import 'package:employees/Items/menu_button.dart';
import 'package:employees/projects/projects_api_handler.dart';
import 'package:employees/models/project.dart';
import 'package:employees/projects/add_project_screen.dart';
import 'package:employees/projects/edit_project_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'info_project_screen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() {
    return _ProjectScreenState();
  }
}

class _ProjectScreenState extends State<ProjectsScreen> {
  final ProjectApiHandler apiHandler = ProjectApiHandler();
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

  void deleteProject(int id) async {
    await apiHandler.deleteProject(id: id);

    getData();
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoProjectScreen(
                        project: data[index],
                        appBarText: "${data[index].Name}",
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProjectScreen(
                                  project: data[index],
                                  appBarText: "Edit ${data[index].Name}",
                                ),
                              ),
                            );
                            getData();
                            print('Edit ${data[index].Name}');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          tooltip: 'Delete',
                          onPressed: () {
                            deleteProject(data[index].Id);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListButton(
              buttonText: "Add Project",
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProjectScreen()),
                );
                getData();
                print('Add new project');
              },
            ),
          ],
        ),
      ],
    );
  }
}
