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
          backgroundColor: Color(0xFFFF6B00),
          foregroundColor: Colors.white,
          minimumSize: Size(200, 60),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.5),
        ),
        child: Text(buttonText,
          style: GoogleFonts.balooBhai2(
            fontWeight: FontWeight.bold,
            fontSize: 18
          )
        ),
    );
  }
}