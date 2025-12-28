import 'package:dropdown_search/dropdown_search.dart';
import 'package:employees/Items/Info_Label.dart';
import 'package:employees/Items/list_Button.dart';
import 'package:employees/models/employee.dart';
import 'package:employees/models/employee_projects.dart';
import 'package:employees/models/job.dart';
import 'package:employees/models/project_employees.dart';
import 'package:employees/projects/projects_api_handler.dart';
import 'package:employees/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class JobsInfoScreen extends StatefulWidget{

  final Job job;
  final String appBarText;
  const JobsInfoScreen({super.key, required this.job, required this.appBarText});

  @override
  State<JobsInfoScreen> createState()
  {
    return _JobsInfoScreenState();
  }

}

class _JobsInfoScreenState extends State<JobsInfoScreen> {
  ProjectApiHandler apiHandler = ProjectApiHandler();


  Employee? selectedEmployee;

  //
  // Future<void> addEmployeeProject(Employee employee) async{
  //
  //   final employeeProjects = EmployeeProjects(
  //       id: 0,
  //       employeeId: employee.Id,
  //       projectId: widget.project.Id
  //   );
  //
  //   final response = await notInApi.addEmployeeProject(employeeProjects: employeeProjects);
  //
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     setState(() {
  //       widget.project.Employees?.add(
  //         ProjectEmployees(
  //           Id : 0,
  //           FirstName: selectedEmployee!.FirstName,
  //           LastName: selectedEmployee!.LastName,
  //         ),
  //       );
  //     });
  //     Navigator.pop(context);
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         title: Text('Error'),
  //         content: Text('Failed to add employee to project.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   if (!mounted) return;
  // }
  //
  // void deleteEmployeeProjects (ProjectEmployees employee) async {
  //   final response = await notInApi.deleteProject(empId: employee.Id, prjId: widget.project.Id);
  //
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     setState(() {
  //       widget.project.Employees?.removeWhere(
  //               (e) => e.Id == employee.Id
  //       );
  //     });
  //   }
  //   else {
  //     print("Error with deleting");
  //   }
  // }
  //
  //
  //

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
                          text: "${widget.job.Name}",
                        ),
                        SizedBox(height: 20),
                        InfoLabel(
                          label: 'Description : ',
                          text: "${widget.job.Description}",
                        ),
                        SizedBox(height: 30),
                        // if (widget.job.employee != null)
                        //   Text(
                        //     'Employee : ${widget.job.employee!.FirstName} ${widget.job.employee!.LastName}',
                        //     style: GoogleFonts.montserrat(
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     IconButton(
                        //       onPressed: () {
                        //         showDialog(context: context, builder: (context){
                        //           return AlertDialog(
                        //             title: Text('Assign Employee'),
                        //             content:
                        //             DropdownSearch<Employee>(
                        //               items: (filter, infiniteScrollProps) async {
                        //                 final employees = await notInApi.getEmployeesNotInProject(widget.project.Id);
                        //                 if (filter != null && filter.isNotEmpty) {
                        //                   return employees.where((e) =>
                        //                   e.FirstName.toLowerCase().contains(filter.toLowerCase()) ||
                        //                       e.LastName.toLowerCase().contains(filter.toLowerCase())
                        //                   ).toList();
                        //                 }
                        //                 return employees;
                        //               },
                        //               itemAsString: (e) => "${e.FirstName} ${e.LastName}",
                        //               compareFn: (a, b) => a.Id == b.Id,
                        //               popupProps: PopupProps.menu(
                        //                   showSearchBox: true,
                        //                   fit: FlexFit.loose
                        //               ),
                        //               onChanged: (value) {
                        //                 selectedEmployee = value;
                        //               },
                        //             ),
                        //             actions: [
                        //               Row(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children: [
                        //                   ListButton(
                        //                       buttonText: "Cancel",
                        //                       onTap: () => Navigator.pop(context)
                        //                   ),
                        //                   ListButton(buttonText: "Add", onTap: () async {
                        //                     if (selectedEmployee != null) {
                        //                       await addEmployeeProject(selectedEmployee!);
                        //                       // setState(() {});
                        //                     }
                        //                   }),
                        //                 ],
                        //               )
                        //             ],
                        //           );
                        //         });
                        //       },
                        //       style: ElevatedButton.styleFrom(
                        //         // backgroundColor: Color.fromARGB(255, 0, 102, 204),
                        //         // foregroundColor: Color.fromARGB(255, 255, 102, 0),
                        //         backgroundColor: Color(0xFFFF6B00),
                        //         foregroundColor: Colors.white,
                        //         minimumSize: Size(100, 50),
                        //         elevation: 4,
                        //         shadowColor: Colors.black.withOpacity(0.5),
                        //       ),
                        //       icon: Icon(Icons.person_add),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}