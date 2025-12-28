import 'package:employees/Items/Info_Label.dart';
import 'package:employees/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'employees_api_handler.dart';


class EmployeesInfoScreen extends StatefulWidget{

  final Employee employee;
  final String appBarText;
  const EmployeesInfoScreen({super.key, required this.employee, required this.appBarText});

  @override
  State<EmployeesInfoScreen> createState()
  {
    return _EmployeesInfoScreenState();
  }

}

class _EmployeesInfoScreenState extends State<EmployeesInfoScreen> {
  final EmployeesApiHandler apiHandler = EmployeesApiHandler();




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
                          label: 'FirstName : ',
                          text: "${widget.employee.FirstName}",
                        ),
                        InfoLabel(
                          label: 'LastName : ',
                          text: "${widget.employee.LastName}",
                        ),
                        if(widget.employee.Email != null)
                          InfoLabel(
                            label: 'Email : ',
                            text: "${widget.employee.Email}",
                          ),
                        SizedBox(height: 30),
                        if(widget.employee.ProjectNames != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Projects:',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (widget.employee.ProjectNames != null && widget.employee.ProjectNames!.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.employee.ProjectNames!.map((project) {
                                    return Row(
                                      children: [
                                        Text(
                                            '- ${project}',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: Colors.black87,
                                            )
                                        ),
                                      ],
                                    );
                                  }).toList()
                                  ,
                                ),
                            ],
                          ),
                        SizedBox(height: 20),
                        if(widget.employee.JobNames != null && widget.employee.JobNames!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tasks:',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (widget.employee.JobNames != null && widget.employee.JobNames!.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.employee.JobNames!.map((job) {
                                    return Row(
                                      children: [
                                        Text(
                                            '- ${job}',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: Colors.black87,
                                            )
                                        ),
                                      ],
                                    );
                                  }).toList()
                                  ,
                                ),
                            ],
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