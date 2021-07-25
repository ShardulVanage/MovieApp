import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Modify_Text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
   

  const Modify_Text(
      {Key? key, required this.text, required this.color, required this.size,  })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.spectral(
          color: color,
          fontSize: size,
         
        ));
  }
}
