import 'package:employees/employees/employees_screen.dart';
import 'package:employees/jobs/jobs_screen.dart';
import 'package:employees/main_menu_screen.dart';
import 'package:employees/application.dart';
import 'package:employees/projects/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListScreen extends StatefulWidget{

  const ListScreen({super.key, required this.activeScreen, required this.backToMenu});

  final String activeScreen;
  final void Function() backToMenu;

  @override
  State<ListScreen> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {


  @override
  Widget build(context) {

    late Widget childWidget;
    late String appBarText;


    if (widget.activeScreen == "projects-screen") {
      childWidget = ProjectsScreen();
      appBarText = "Projects";
    }

    if (widget.activeScreen == "employees-screen") {
      childWidget = EmployeesScreen();
      appBarText = "Employees";
    }

    if (widget.activeScreen == "jobs-screen") {
      childWidget = JobsScreen();
      appBarText = "Tasks";
    }



    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: widget.backToMenu,
                  icon: Icon(Icons.arrow_back, color: Colors.white)
              ),
              title: Text(appBarText, style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              )),
              backgroundColor: Color.fromARGB(255, 30, 42, 56),
              centerTitle: true,
            ),
            body:Container(
                margin: EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 243, 247, 250)),
                child: childWidget
            )
        )
    );
  }
}