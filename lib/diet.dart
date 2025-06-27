import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_check_2/navbar.dart';

class DietScreen extends StatefulWidget {
  double dietval;

  DietScreen({
    Key? key,
    this.dietval = 0.0,
  }) : super(key: key);

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  String _calculatediet() {
    String ddp = '';
    double kcal = widget.dietval;

    double cho = (widget.dietval * 0.60) / 4;
    double chon = (widget.dietval * 0.15) / 4;
    double fat = (widget.dietval * 0.25) / 9;

    String newcho = cho.toStringAsFixed(0);
    String newchon = chon.toStringAsFixed(0);
    String newfat = fat.toStringAsFixed(0);
    String newkcal = kcal.toStringAsFixed(0);

    ddp = '$newkcal-$newcho-$newchon-$newfat';

    return ddp;
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
              'DIET',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              height: 330,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
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
                    widget.dietval.toStringAsFixed(2),
                    style: const TextStyle(
                      fontFamily: 'Catamaran',
                      fontSize: 70,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff0BE8CD),
                    ),
                  ),
                  const Text(
                    'kcal',
                    style: TextStyle(
                      fontFamily: 'Catamaran',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff33338B),
                    ),
                  ),
                  const Text('______________________________________________'),
                  const SizedBox(
                    height: 10,
                  ),
                  //final
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Carbohydrates: ',
                            style: TextStyle(
                              fontFamily: 'Catamaran',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000033),
                            ),
                          ),
                          Text(
                            'Proteins: ',
                            style: TextStyle(
                              fontFamily: 'Catamaran',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000033),
                            ),
                          ),
                          Text(
                            'Fats: ',
                            style: TextStyle(
                              fontFamily: 'Catamaran',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000033),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: const [
                              Text(
                                '60%',
                                style: TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff33338B),
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                ' of TER',
                                style: TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000033),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                '15%',
                                style: TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff33338B),
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                ' of TER',
                                style: TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000033),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                '25%',
                                style: TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff33338B),
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Text(
                                ' of TER',
                                style: TextStyle(
                                  fontFamily: 'Catamaran',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000033),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          ElevatedButton(
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
        ],
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
                  height: 350,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Dietary Prescription:',
                          style: TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000033),
                          ),
                        ),
                        Text(
                          _calculatediet(),
                          style: const TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 30,
                            color: Color(0xff0BE8CD),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Text(
                          '_____________________',
                          style: TextStyle(
                            fontFamily: 'Catamaran',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFBBE06),
                          ),
                        ),

                        //
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'Carbohydrates: ',
                                      style: TextStyle(
                                        fontFamily: 'Catamaran',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff000033),
                                      ),
                                    ),
                                    Text(
                                      'Proteins: ',
                                      style: TextStyle(
                                        fontFamily: 'Catamaran',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff000033),
                                      ),
                                    ),
                                    Text(
                                      'Fats: ',
                                      style: TextStyle(
                                        fontFamily: 'Catamaran',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff000033),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          '60%',
                                          style: TextStyle(
                                            fontFamily: 'Catamaran',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff33338B),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          ' of TER',
                                          style: TextStyle(
                                            fontFamily: 'Catamaran',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff000033),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '15%',
                                          style: TextStyle(
                                            fontFamily: 'Catamaran',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff33338B),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          ' of TER',
                                          style: TextStyle(
                                            fontFamily: 'Catamaran',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff000033),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '25%',
                                          style: TextStyle(
                                            fontFamily: 'Catamaran',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff33338B),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          ' of TER',
                                          style: TextStyle(
                                            fontFamily: 'Catamaran',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff000033),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
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
}
