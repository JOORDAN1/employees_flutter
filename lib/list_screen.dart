import 'package:employees/main_menu_screen.dart';
import 'package:employees/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListScreen extends StatefulWidget{

  const ListScreen({super.key});

  @override
  State<ListScreen> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {


  var activeScreen = "main-menu-screen";

  void switchScreenToProjects() {
    setState(() {
      activeScreen = "projects-screen";
    });
  }

  void switchScreenToEmployees() {
    setState(() {
      activeScreen = "employees-screen";
    });
  }

  void switchScreenToTasks() {
    setState(() {
      activeScreen = "tasks-screen";
    });
  }

  void switchScreenToMenu() {
    setState(() {
      activeScreen = "main-menu-screen";
    });
  }

  @override
  Widget build(context) {

    Widget screenWidget =  MainMenu(
        switchScreenToProjects,
        switchScreenToEmployees,
        switchScreenToTasks
    );


    if (activeScreen == "main-menu-screen") {
      screenWidget =  MainMenu(
          switchScreenToProjects,
          switchScreenToEmployees,
          switchScreenToTasks
      );
    }

    if (activeScreen == "projects-screen") {
      screenWidget = ProjectsScreen();
    }

    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text("Projects and Employees", style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold
            )),
            backgroundColor: Color.fromARGB(255, 30, 42, 56),
            centerTitle: true,
          ),
            body:Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 243, 247, 250)),
              child: screenWidget,
            )
        )
    );
  }
}