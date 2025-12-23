import 'package:employees/Items/list_Button.dart';
import 'package:employees/jobs/jobs_api_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../models/job.dart';

class EditJobScreen extends StatefulWidget{

  final Job job;
  final String appBarText;
  const EditJobScreen({super.key, required this.job, required this.appBarText});

  @override
  State<EditJobScreen> createState()
  {
    return _EditJobScreenState();
  }

}

class _EditJobScreenState extends State<EditJobScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  JobsApiHandler apiHandler = JobsApiHandler();
  late http.Response response;

  void UpdateData() async {
    if(_formKey.currentState!.saveAndValidate())
    {
      final data = _formKey.currentState!.value;

      final job = Job(
          Id: widget.job.Id,
          Name: data['Name'],
          Description: data['Description']
      );

      response = await apiHandler.updateJob(job: job, id: widget.job.Id);

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
                    color: Color.fromARGB(255, 243, 247, 250)),
                child : Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: FormBuilder(
                    key: _formKey,
                    initialValue: {
                      'Name' : widget.job.Name,
                      'Description' : widget.job.Description
                    },
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
                        ListButton(buttonText: "Update Task", onTap: UpdateData)
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}