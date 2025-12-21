  import 'package:employees/Items/menu_button.dart';
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

  class MainMenu extends StatelessWidget{

    const MainMenu(
        this.goToProjects,
        this.goToEmployees,
        this.goToTasks,
        {super.key}
        );

    final void Function() goToProjects;
    final void Function() goToEmployees;
    final void Function() goToTasks;

    @override
    Widget build(context)
    {
      return MaterialApp(
          home:Scaffold(
              body:Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 243, 247, 250)),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(''
                          'assets/images/logo.png',
                        width: 300,
                      ),
                      // MenuButton(buttonText: "Projects", onTap: goToProjects),
                      MenuButton(buttonText: "Projects", onTap: goToProjects),
                      SizedBox(height: 10),
                      MenuButton(buttonText: "Employees", onTap: goToEmployees,),
                      SizedBox(height: 10),
                      MenuButton(buttonText: "Tasks", onTap: goToTasks,)
                    ],
                  ),
                )
              )
          )
      );
    }

  }