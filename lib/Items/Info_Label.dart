import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoLabel extends StatelessWidget{

  const InfoLabel(
      {
        required this.label,
        required this.text,
        super.key
      });

  final String label;
  final String text;

  Widget build(context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: label,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: text,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

}