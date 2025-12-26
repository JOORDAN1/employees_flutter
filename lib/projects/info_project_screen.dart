import 'package:employees/Items/Info_Label.dart';
import 'package:employees/Items/list_Button.dart';
import 'package:employees/projects/projects_api_handler.dart';
import 'package:employees/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class InfoProjectScreen extends StatefulWidget{

  final Project project;
  final String appBarText;
  const InfoProjectScreen({super.key, required this.project, required this.appBarText});

  @override
  State<InfoProjectScreen> createState()
  {
    return _InfoProjectScreenState();
  }

}

class _InfoProjectScreenState extends State<InfoProjectScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  ProjectApiHandler apiHandler = ProjectApiHandler();
  late http.Response response;



  void UpdateData() async {
    if(_formKey.currentState!.saveAndValidate())
    {
      final data = _formKey.currentState!.value;

      final project = Project(
          Id: widget.project.Id,
          Name: data['Name'],
          Description: data['Description']
      );

      response = await apiHandler.updateProject(project: project, id: widget.project.Id);

      if(!mounted) return;
      Navigator.pop(context);
    }
  }


  @override
  Widget build(context) {
    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white)
              ),
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
                    // color: Color.fromARGB(255, 243, 247, 250)
                ),
                child : Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoLabel(
                          label: 'Name : ',
                          text: "${widget.project.Name}",
                        ),
                        SizedBox(height: 20),
                        InfoLabel(
                          label: 'Description : ',
                          text: "${widget.project.Description}",
                        ),
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}