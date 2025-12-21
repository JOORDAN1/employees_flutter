import 'package:employees/Items/menu_button.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget{

  MainMenu({super.key});


  @override
  Widget build(context)
  {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MenuButton(buttonText: "Projects", onTap: () {},),
          SizedBox(height: 10),
          MenuButton(buttonText: "Employees", onTap: () {},),
          SizedBox(height: 10),
          MenuButton(buttonText: "Tasks", onTap: () {},)
        ],
      ),
    );
  }

}