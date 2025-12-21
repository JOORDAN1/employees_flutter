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
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(data[index].Name),
                subtitle: Text(data[index].Description),
              );
            },
          ),
          ElevatedButton(onPressed: () {}, child: Text("Add Project")
          )
        ],
      ),
    );
  }
}