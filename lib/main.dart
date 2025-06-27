import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_check_2/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bmi(),
    );
  }
}

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BmiState createState() => _BmiState();
}

final heightft = TextEditingController();
final heightin = TextEditingController();
final weight = TextEditingController();
final age = TextEditingController();

String sex = '';

double calculate() {
  var hft = double.parse(heightft.text);
  var hin = double.parse(heightin.text);
  var wei = double.parse(weight.text);

  var m = (hin * 1 / 12) + hft;
  var meters = m * 1 / 3.28084;
  double bmi = wei / (meters * meters);

  return bmi;
}

String clasif = '';

String classification() {
  double bmi = calculate();

  if (bmi > 30) {
    clasif = 'Obese';
  } else if (bmi >= 25 && bmi <= 29.9) {
    clasif = 'Overweight';
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    clasif = 'Normal';
  } else {
    clasif = 'Underweight';
  }

  return clasif;
}

class _BmiState extends State<Bmi> {
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // to remove the <- arrow back button
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Text(
              'BMI',
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
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1st container for select sex
                  Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Select Sex:',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff000033),
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff3F47FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              fixedSize: const Size(120, 120), // background
                            ),
                            onPressed: () {
                              sex = 'Male';
                            },
                            child: const Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 90,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xffFF3F79), // background
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              fixedSize: const Size(120, 120),
                            ),
                            onPressed: () {
                              sex = 'Female';
                            },
                            child: const Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 90,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //2nd container for height
                  Container(
                    width: 330,
                    height: 180,
                    decoration: BoxDecoration(
                      color: const Color(0xff0BE8CD),
                      border: Border.all(color: const Color(0xff0BE8CD)),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Height',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Catamaran',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 100,
                              child: TextField(
                                // validator: (textval) {
                                //   if (textval == null || textval.isEmpty) {
                                //     return 'Empty';
                                //   }
                                //   return null;
                                // },
                                controller: heightft,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2),
                                )),
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'Catamaran',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff33338B),
                                ),
                              ),
                            ),
                            const Text(
                              'ft',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Catamaran',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 70,
                              height: 100,
                              child: TextField(
                                // validator: (textval) {
                                //   if (textval == null || textval.isEmpty) {
                                //     return 'Empty';
                                //   }
                                //   return null;
                                // },
                                controller: heightin,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 2),
                                )),
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'Catamaran',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff33338B),
                                ),
                              ),
                            ),
                            const Text(
                              'in',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // 3rd section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //2 rows for weight and age
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Weight',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Catamaran',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 70,
                                height: 80,
                                child: TextField(
                                  // validator: (textval) {
                                  //   if (textval == null || textval.isEmpty) {
                                  //     return 'Empty';
                                  //   }
                                  //   return null;
                                  // },
                                  controller: weight,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                  )),
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'Catamaran',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff33338B),
                                  ),
                                ),
                              ),
                              const Text(
                                'kg',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Catamaran',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                            ]),
                      ),
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Age',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Catamaran',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 70,
                                height: 80,
                                child: TextField(
                                  // validator: (textval) {
                                  //   if (textval == null || textval.isEmpty) {
                                  //     return 'Empty';
                                  //   }
                                  //   return null;
                                  // },
                                  controller: age,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                  )),
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'Catamaran',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff33338B),
                                  ),
                                ),
                              ),
                              const Text(
                                'years old',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Catamaran',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                            ]),
                      ),
                    ],
                  ),

                  //last button
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
                        // Validate returns true if the form is valid, or false otherwise.
                        // if (_formKey.currentState!.validate()) {
                        //   // If the form is valid, display a snackbar. In the real world,
                        //   // you'd often call a server or save the information in a database.

                        // }
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
          ),
        ),
      ),
    );
  }
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
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Sex: ',
                                style: TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000033),
                                ),
                              ),
                              Text(
                                sex,
                                style: const TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000033),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Age: ',
                                style: TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000033),
                                ),
                              ),
                              Text(
                                age.text,
                                style: const TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000033),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'BMI:',
                        style: TextStyle(
                          fontFamily: 'Catamaran',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000033),
                        ),
                      ),
                      Text(
                        calculate().toStringAsFixed(2),
                        style: const TextStyle(
                          fontFamily: 'Catamaran',
                          fontSize: 50,
                          color: Color(0xff0BE8CD),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        classification(),
                        style: const TextStyle(
                          fontFamily: 'Catamaran',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFBBE06),
                        ),
                      )
                    ]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fixedSize: const Size(300, 50)),
                onPressed: () {
                  Navigator.of(context).pop(true);
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
