import 'package:employees/Items/list_Button.dart';
import 'package:employees/Items/menu_button.dart';
import 'package:employees/employees/add_employee_screen.dart';
import 'package:employees/employees/edit_employee_screen.dart';
import 'package:employees/employees/employees_api_handler.dart';
import 'package:employees/models/employee.dart';
import 'package:employees/projects/projects_api_handler.dart';
import 'package:employees/models/project.dart';
import 'package:employees/projects/add_project_screen.dart';
import 'package:employees/projects/edit_project_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeesScreen extends StatefulWidget{

  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState()
  {
    return _EmployeesScreen();
  }


}

class _EmployeesScreen extends State<EmployeesScreen> {

  final EmployeesApiHandler apiHandler = EmployeesApiHandler();
  List<Employee> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final result = await apiHandler.getEmployeeData();
    setState(() {
      data = result;
      isLoading = false;
    });
  }

  void deleteEmployee(int id) async{
    await apiHandler.deleteEmployee(id: id);
    getData();
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "${data[index].FirstName} ${data[index].LastName}",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      data[index].Email!,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.orange,
                          tooltip: 'Edit',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => EditEmployeeScreen(employee: data[index], appBarText: "Edit ${data[index].FirstName} ${data[index].LastName}"))
                            );
                            print('Edit ${data[index].FirstName} ${data[index].LastName}');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          tooltip: 'Delete',
                          onPressed: () {
                            deleteEmployee(data[index].Id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListButton(
              buttonText: "Add Employee",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => AddEmployeeScreen())
                );
                print('Add new employee');
              },
            ),
            ListButton(
              buttonText: "Refresh",
              onTap: getData,
            ),
          ],
        )

      ],
    );
  }
}