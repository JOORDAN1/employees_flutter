import 'package:employees/Items/list_Button.dart';
import 'package:employees/Items/menu_button.dart';
import 'package:employees/api_handler.dart';
import 'package:employees/models/project.dart';
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
  // ApiHandler apiHandler = ApiHandler();
  // late List<Project> data = [];
  //
  // void getData() async {
  //   data = await apiHandler.getProjectData();
  //   setState(() {});
  // }
  //
  // @override
  // void initState(){
  //   getData();
  //   super.initState();
  // }

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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].Name,
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data[index].Description,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ListButton(buttonText: "Add Project", onTap: () {})
        ],
      ),
    );
  }
}