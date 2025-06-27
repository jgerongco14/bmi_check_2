import 'package:bmi_check_2/diet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_check_2/navbar.dart';

class TerScreen extends StatefulWidget {
  double passvalue;

  TerScreen({Key? key, this.passvalue = 0.0}) : super(key: key);

  @override
  State<TerScreen> createState() => _TerScreenState();
}

class _TerScreenState extends State<TerScreen> {
  final list = <String>[
    'Activity Level',
    'Bedrest', //27.5 kcal/kg
    'Sedentary', //30 kcal/kg
    'Light', //35 kcal/kg
    'Moderate', //40 kcal/kg
    'Heavy' //45 kcal/kg
  ];

  final resultdbw = TextEditingController();

  String newvalue = '';
  String activity = '';

  late String dropdownValue;
  @override
  void initState() {
    // TODO: implement
    dropdownValue = list.first;
    super.initState();
  }

  double _calculate() {
    double olddbw = widget.passvalue;
    double output = 0.0;

    if (activity == 'Bedrest') {
      output = olddbw * 27.5;
    } else if (activity == 'Sedentary') {
      output = olddbw * 30.0;
    } else if (activity == 'Light') {
      output = olddbw * 35.0;
    } else if (activity == 'Moderate') {
      output = olddbw * 40.0;
    } else if (activity == 'Heavy') {
      output = olddbw * 45.0;
    }

    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Text(
              'TER',
              style: GoogleFonts.catamaran(
                  textStyle: const TextStyle(
                      color: Color(0xff0BE8CD), fontWeight: FontWeight.w800),
                  fontSize: 40),
            ),
            Text(
              'Check',
              style: GoogleFonts.catamaran(
                  textStyle: const TextStyle(
                      color: Color(0xff000033), fontWeight: FontWeight.w800),
                  fontSize: 40),
            ),
          ],
        ),
      ),
      endDrawer: const Navbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'TER: ',
                    style: TextStyle(
                      fontFamily: 'Catamaran',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000033),
                    ),
                  ),
                  Text(
                    widget.passvalue.toStringAsFixed(2),
                    style: const TextStyle(
                      fontFamily: 'Catamaran',
                      fontSize: 70,
                      color: Color(0xff0BE8CD),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Text(
                    'kcal',
                    style: TextStyle(
                      fontFamily: 'Catamaran',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff33338B),
                    ),
                  ),
                ],
              ),
            ),
            // 2nd section
            SizedBox(
              height: 90,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: const Color(0xff0BE8CD),
                      border:
                          Border.all(width: 2, color: const Color(0xff33338B))),
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 30,
                    ),
                    elevation: 16,
                    style: const TextStyle(color: Color(0xff33338B)),
                    onChanged: (String? actval) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = actval!;
                        activity = dropdownValue;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String actval) {
                      return DropdownMenuItem<String>(
                        value: actval,
                        child: Text(
                          actval,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Catamaran',
                              fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            // 3rd section
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff000033),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize: const Size(300, 50)),
                onPressed: () {
                  showAlert(context);
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontFamily: 'Catamaran',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'TER:',
                          style: TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000033),
                          ),
                        ),
                        Text(
                          _calculate().toStringAsFixed(2),
                          style: const TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 50,
                            color: Color(0xff0BE8CD),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Text(
                          'kcal',
                          style: TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff33338B),
                          ),
                        ),
                        const Text(
                          '____________________',
                          style: TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff33338B),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'DBW:',
                          style: TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff33338B),
                          ),
                        ),
                        Text(
                          '${widget.passvalue.toStringAsFixed(2)} kg',
                          style: const TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff33338B),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Activity Level: ',
                          style: TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff33338B),
                          ),
                        ),
                        Text(
                          activity,
                          style: const TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff33338B),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ]),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0BE8CD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(300, 50)),
                  onPressed: () {
                    double value = _calculate();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DietScreen(dietval: value)));
                  },
                  child: const Text(
                    'Proceed to DIETCheck',
                    style: TextStyle(
                      fontFamily: 'Catamaran',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff33338B),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(300, 50)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Catamaran',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
