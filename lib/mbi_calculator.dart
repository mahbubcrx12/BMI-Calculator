import 'dart:ui';

import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _currentSliderValue = 20;
  double _ageValue = 20;
  double _weightValue = 60;
  bool isMale = false;
  bool isFemale = false;
  var bmi;

  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "BMI CALCULATOR",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFemale = false;
                            isMale = true;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * .30,
                          width: MediaQuery.of(context).size.width * .30,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.male,
                                color: isMale == true
                                    ? Colors.redAccent
                                    : Colors.white,
                                size: 70,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white38),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFemale = true;
                            isMale = false;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width * .30,
                          width: MediaQuery.of(context).size.width * .30,
                          decoration: BoxDecoration(
                            color: isFemale == true
                                ? Colors.redAccent
                                : Colors.white10,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.female,
                                color: Colors.white,
                                size: 70,
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white38),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  color: Colors.white10,
                  child: Column(
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(fontSize: 25, color: Colors.white38),
                      ),
                      Center(
                        child: Container(
                          //color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${_currentSliderValue}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white),
                              ),
                              Text(
                                "cm",
                                style: TextStyle(
                                    color: Colors.white38, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Slider(
                          activeColor: Colors.white,
                          thumbColor: Colors.pinkAccent,
                          value: _currentSliderValue,
                          max: 250,
                          divisions: 10,
                          label: _currentSliderValue.round.toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * .35,
                      width: MediaQuery.of(context).size.width * .35,
                      color: Colors.white10,
                      child: Column(
                        children: [
                          Text(
                            "WEIGHT",
                            style:
                                TextStyle(fontSize: 25, color: Colors.white38),
                          ),
                          Text(
                            "${_weightValue}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _weightValue = _weightValue - 1;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white10),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _weightValue = _weightValue + 1;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white10),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * .35,
                      width: MediaQuery.of(context).size.width * .35,
                      color: Colors.white10,
                      child: Column(
                        children: [
                          Text(
                            "AGE",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 25),
                          ),
                          Text(
                            "${_ageValue}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _ageValue = _ageValue - 1;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white10),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _ageValue = _ageValue + 1;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white10),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      bmi = _weightValue /
                          (_currentSliderValue * _currentSliderValue) *
                          10000;
                      print("pppp ${bmi}");
                      if (bmi < 19) {

                        result="you are under weight";
                      } else if (bmi < 24) {

                        result="you are ok";
                      } else {

                        result="You are over weight";
                      }
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 5,
                              child: Container(
                                width: 300.0,
                                height: 300.0,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: Text(
                                            "BMI = $bmi",
                                            style: TextStyle(
                                                fontSize: 36, color: Colors.black),
                                          )),
                                      Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Result = $result",
                                              style: TextStyle(
                                                  fontSize: 36, color: Colors.black),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: double.infinity,
                      //height: MediaQuery.of(context).size.height * .8,
                      color: Colors.pink,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "CALCULATE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
