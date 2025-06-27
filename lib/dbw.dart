import 'package:bmi_check_2/ter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_check_2/navbar.dart';

class DbwScreen extends StatefulWidget {
  const DbwScreen({super.key});

  @override
  State<DbwScreen> createState() => _DbwScreenState();
}

final heightft = TextEditingController();
final heightin = TextEditingController();
String sex = '';
String method = '';

double dbwtan() {
  var hft = double.parse(heightft.text);
  var hin = double.parse(heightin.text);

  var inches = (hft * 12) + hin;
  var convertCM = (inches * 2.54) - 100;
  var getPercent = convertCM * 0.1;
  double output = convertCM - getPercent;
  return output;
}

double dbwham() {
  var hft = double.parse(heightft.text);
  var hin = double.parse(heightin.text);

  double m = 0.0;
  double minplu = 0.0;
  double output = 0.0;

  if (sex == 'Female') {
    if (hft < 5) {
      minplu = 12 - hin;
      m = 100 - (minplu * 5);
      var dbwham = m / 2.2;
      output = dbwham;
    } else {
      minplu = 12 - hin;
      m = 100 + (minplu * 5);
      var dbwham = m / 2.2;
      output = dbwham;
    }
  } else {
    if (hft < 5) {
      minplu = 12 - hin;
      m = 106 - (minplu * 6);
      var dbwham = m / 2.2;
      output = dbwham;
    } else {
      minplu = 12 - hin;
      m = 106 + (minplu * 6);
      var dbwham = m / 2.2;
      output = dbwham;
    }
  }
  return output;
}

double dbwbmi() {
  var hft = double.parse(heightft.text);
  var hin = double.parse(heightin.text);

  double m = 0;
  double convertcm = 0;
  double mdo = 0;
  double dbwkg = 0;

  m = (hft * 12) + hin;
  convertcm = m * 2.54;
  mdo = convertcm / 100;
  dbwkg = (mdo * mdo) * 22;

  return dbwkg;
}

double answer() {
  double output = 0.0;

  if (method == 'tannhauser') {
    output = dbwtan();
  } else if (method == 'hamwi') {
    output = dbwham();
  } else if (method == 'bmi') {
    output = dbwbmi();
  }

  return output;
}

class _DbwScreenState extends State<DbwScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Text(
              'DBW',
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
        builder: (context, contraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: contraints.maxHeight),
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
                  //2nd section
                  Container(
                    width: 320,
                    height: 200,
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

                  //3rd section
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
                        chooseAlert(context);
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
                ]),
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
          contentPadding: const EdgeInsets.all(10),
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 250,
                width: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'DBW:',
                        style: TextStyle(
                          fontFamily: 'Catamaran',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000033),
                        ),
                      ),
                      Text(
                        answer().toStringAsFixed(2),
                        style: const TextStyle(
                          fontFamily: 'Catamaran',
                          fontSize: 50,
                          color: Color(0xff0BE8CD),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Text(
                        'kg',
                        style: TextStyle(
                          fontFamily: 'Catamaran',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff33338B),
                        ),
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
                  Navigator.of(context).pop(true);
                  double value = answer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TerScreen(passvalue: value)));
                },
                child: const Text(
                  'Proceed to TER',
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

chooseAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(10),
          backgroundColor: Colors.transparent,
          content: Container(
            height: 350,
            width: 450,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Choose Method:',
                  style: TextStyle(
                    fontFamily: 'Catamaran',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000033),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Gender: ',
                      style: TextStyle(
                        fontFamily: 'Catamaran',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000033),
                      ),
                    ),
                    Text(
                      sex,
                      style: const TextStyle(
                        fontFamily: 'Catamaran',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000033),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff33338B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fixedSize: const Size(400, 50)),
                    onPressed: () {
                      method = 'tannhauser';
                      showAlert(context);
                    },
                    child: const Text(
                      'Tannhauser ',
                      style: TextStyle(
                        fontFamily: 'Catamaran',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff33338B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fixedSize: const Size(300, 50)),
                    onPressed: () {
                      method = 'hamwi';
                      showAlert(context);
                    },
                    child: const Text(
                      'Hamwi ',
                      style: TextStyle(
                        fontFamily: 'Catamaran',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff33338B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fixedSize: const Size(300, 50)),
                    onPressed: () {
                      method = 'bmi';
                      showAlert(context);
                    },
                    child: const Text(
                      'BMI Formula ',
                      style: TextStyle(
                        fontFamily: 'Catamaran',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
