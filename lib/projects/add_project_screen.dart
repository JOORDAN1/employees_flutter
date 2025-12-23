import 'package:employees/Items/list_Button.dart';
import 'package:employees/projects/projects_api_handler.dart';
import 'package:employees/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddProjectScreen extends StatefulWidget{


  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState()
  {
    return _AddProjectScreenState();
  }

}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  ProjectApiHandler apiHandler = ProjectApiHandler();

  void addProject() async{
    if(_formKey.currentState!.saveAndValidate())
      {
        final data = _formKey.currentState!.value;

        final project = Project(
            Id: 0,
            Name: data['Name'],
            Description: data['Description'],
        );

        await apiHandler.addProject(project: project);
      }

    if (!mounted) return;
    Navigator.pop(context);
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
              title: Text("Add Project", style: GoogleFonts.montserrat(
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
                child : Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'Name',
                          decoration: const InputDecoration(labelText: 'Name'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(50)
                          ]
                          ),),
                        SizedBox(height: 20,),
                        FormBuilderTextField(
                          name: 'Description',
                          decoration: const InputDecoration(labelText: 'Description'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(200)
                          ]
                          ),),
                        SizedBox(height: 20),
                        ListButton(buttonText: "Add Project", onTap: addProject)
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}