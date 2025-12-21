import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends StatelessWidget{

  const MenuButton(
      {
        super.key,
        required this.buttonText,
        required this.onTap,
      });

  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          // backgroundColor: Color.fromARGB(255, 0, 102, 204),
          // foregroundColor: Color.fromARGB(255, 255, 102, 0),
          backgroundColor: Color.fromARGB(255, 255, 102, 0),
          foregroundColor: Color.fromARGB(255, 29, 128, 227),
          minimumSize: Size(200, 60)
        ),
        child: Text(buttonText,
          style: GoogleFonts.balooBhai2(
            fontWeight: FontWeight.bold
          ),
        ));
  }
}