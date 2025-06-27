import 'package:bmi_check_2/dbw.dart';
import 'package:bmi_check_2/diet.dart';
import 'package:bmi_check_2/main.dart';
import 'package:bmi_check_2/ter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Bmi()));
            },
            child: Row(
              children: [
                Text(
                  'BMI',
                  style: GoogleFonts.catamaran(
                      textStyle: const TextStyle(
                          color: Color(0xff0BE8CD),
                          fontWeight: FontWeight.w800),
                      fontSize: 30),
                ),
                Text(
                  'Check',
                  style: GoogleFonts.catamaran(
                      textStyle: const TextStyle(
                          color: Color(0xff000033),
                          fontWeight: FontWeight.w800),
                      fontSize: 30),
                ),
              ],
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DbwScreen()));
            },
            child: Row(
              children: [
                Text(
                  'DBW',
                  style: GoogleFonts.catamaran(
                      textStyle: const TextStyle(
                          color: Color(0xff0BE8CD),
                          fontWeight: FontWeight.w800),
                      fontSize: 30),
                ),
                Text(
                  'Check',
                  style: GoogleFonts.catamaran(
                      textStyle: const TextStyle(
                          color: Color(0xff000033),
                          fontWeight: FontWeight.w800),
                      fontSize: 30),
                ),
              ],
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TerScreen()));
            },
            child: Row(
              children: [
                Text(
                  'TER',
                  style: GoogleFonts.catamaran(
                      textStyle: const TextStyle(
                          color: Color(0xff0BE8CD),
                          fontWeight: FontWeight.w800),
                      fontSize: 30),
                ),
                Text(
                  'Check',
                  style: GoogleFonts.catamaran(
                      textStyle: const TextStyle(
                          color: Color(0xff000033),
                          fontWeight: FontWeight.w800),
                      fontSize: 30),
                ),
              ],
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietScreen()));
            },
            child: Row(
              children: [
                Text(
                  'DIET',
                  style: GoogleFonts.catamaran(
                      textStyle: const TextStyle(
                          color: Color(0xff0BE8CD),
                          fontWeight: FontWeight.w800),
                      fontSize: 30),
                ),
                Text(
                  'Check',
                  style: GoogleFonts.catamaran(
                      textStyle: const TextStyle(
                          color: Color(0xff000033),
                          fontWeight: FontWeight.w800),
                      fontSize: 30),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
