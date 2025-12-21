import 'package:employees/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Application extends StatefulWidget{

  Application({super.key});

  @override
  State<Application> createState() {
    return _ApplicationState();
  }
}

class _ApplicationState extends State<Application> {

  Widget screenWidget = MainMenu();

  @override
  Widget build(context) {

    return MaterialApp(
      home:Scaffold(
        // appBar: AppBar(
        //   title: Text("Projects and Employees", style: GoogleFonts.montserrat(
        //     color: Colors.white,
        //     fontSize: 22,
        //     fontWeight: FontWeight.bold
        //   )),
        //   backgroundColor: Color.fromARGB(255, 30, 42, 56),
        //   centerTitle: true
        // ),
        body:Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 247, 250)),
            child: screenWidget,
        )
      )
    );
  }
}