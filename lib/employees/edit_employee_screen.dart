import 'package:employees/Items/list_Button.dart';
import 'package:employees/employees/employees_api_handler.dart';
import 'package:employees/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class EditEmployeeScreen extends StatefulWidget{

  final Employee employee;
  final String appBarText;
  const EditEmployeeScreen({super.key, required this.employee, required this.appBarText});

  @override
  State<EditEmployeeScreen> createState()
  {
    return _EditEmployeeScreenState();
  }

}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  EmployeesApiHandler apiHandler = EmployeesApiHandler();
  late http.Response response;

  void UpdateData() async {
    if(_formKey.currentState!.saveAndValidate())
    {
      final data = _formKey.currentState!.value;

      final employee = Employee(
          Id: widget.employee.Id,
          FirstName : data['FirstName'],
          LastName:  data['LastName'],
          Email: data['Email']
      );

      response = await apiHandler.updateEmployee(employee: employee, id: widget.employee.Id);

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
                      'FirstName' : widget.employee.FirstName,
                      'LastName' : widget.employee.LastName,
                      'Email' : widget.employee.Email
                    },
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
                        ListButton(buttonText: "Update", onTap: UpdateData)
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}