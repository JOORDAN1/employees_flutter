import 'package:employees/list_screen.dart';
import 'package:employees/main_menu_screen.dart';
import 'package:employees/projects/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Application extends StatefulWidget{

  const Application({super.key});

  @override
  State<Application> createState() {
    return _ApplicationState();
  }
}

class _ApplicationState extends State<Application> {


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
      screenWidget = ListScreen(activeScreen: "projects-screen");
    }

    return screenWidget;
  }
}