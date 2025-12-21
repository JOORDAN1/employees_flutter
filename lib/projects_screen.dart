import 'package:employees/Items/menu_button.dart';
import 'package:employees/api_handler.dart';
import 'package:employees/models/project.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget{

  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState()
  {
    return _ProjectScreenState();
  }



}

class _ProjectScreenState extends State<ProjectsScreen>
{
  @override
  Widget build(context)
  {
    ApiHandler apiHandler = ApiHandler();
    late List<Project> data = [];

    void getData() async {
      data = await apiHandler.getProjectData();
      setState(() {});
    }

    @override
    void initState(){
      getData();
      super.initState();
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading: Text("${data[index].Id}"),
                title: Text(data[index].Name),
                subtitle: Text(data[index].Description),
              );
            },
          )
        ],
      ),
    );
  }

}