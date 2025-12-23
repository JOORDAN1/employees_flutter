import 'package:employees/Items/list_Button.dart';
import 'package:employees/employees/employees_api_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../models/employee.dart';

class AddEmployeeScreen extends StatefulWidget{


  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState()
  {
    return _AddEmployeeScreenState();
  }

}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  EmployeesApiHandler apiHandler = EmployeesApiHandler();

  void addEmployee() async{
    if(_formKey.currentState!.saveAndValidate())
    {
      final data = _formKey.currentState!.value;

      final employee = Employee(
        Id: 0,
        FirstName: data['FirstName'],
        LastName: data['LastName'],
        Email: data['Email'],
      );

      await apiHandler.addEmployee(employee: employee);
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
              title: Text("Add Employee", style: GoogleFonts.montserrat(
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
                          name: 'FirstName',
                          decoration: const InputDecoration(labelText: 'FirstName'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(20)
                          ]
                          ),),
                        SizedBox(height: 20,),
                        FormBuilderTextField(
                          name: 'LastName',
                          decoration: const InputDecoration(labelText: 'LastName'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(30)
                          ]
                          ),),
                        SizedBox(height: 20,),
                        FormBuilderTextField(
                          name: 'Email',
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.maxLength(50)
                          ]
                          ),),
                        SizedBox(height: 20),
                        ListButton(buttonText: "Add Employee", onTap: addEmployee)
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}