import 'package:employees/main_menu_screen.dart';
import 'package:employees/application.dart';
import 'package:employees/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListScreen extends StatefulWidget{

  const ListScreen({super.key, required this.activeScreen});

  final String activeScreen;

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

    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
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