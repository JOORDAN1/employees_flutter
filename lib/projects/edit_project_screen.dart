import 'package:employees/Items/list_Button.dart';
import 'package:employees/Items/menu_button.dart';
import 'package:employees/api_handler.dart';
import 'package:employees/models/project.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProjectScreen extends StatefulWidget{

  final Project project;
  final String appBarText;
  const EditProjectScreen({super.key, required this.project, required this.appBarText});

  @override
  State<EditProjectScreen> createState()
  {
    return _EditProjectScreenState();
  }

}

class _EditProjectScreenState extends State<EditProjectScreen> {

  @override
  Widget build(context) {
    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text(widget.appBarText, style: GoogleFonts.montserrat(
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
                // child: childWidget
            )
        )
    );
  }
}