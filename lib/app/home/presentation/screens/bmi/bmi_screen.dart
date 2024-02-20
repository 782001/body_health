import 'dart:math';

import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/app_theme_colors.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import 'BMI RESULT.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<BmiScreen> {
  bool isMale = true;
  double hight = 120;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue.shade900,
      //   title:  Text('BMI CALCULATOR'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            height: context.height * 0.23,
                            width: context.width * 0.42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: isMale
                                  ? Colors.blueGrey
                                  : AppColors.kGreyColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                    male,
                                  ),
                                  height: 90,
                                  width: 90,
                                  // color: Colors.cyan,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('male')!,
                                  style: TextStyle(
                                    fontFamily: CairoFont,
                                    fontSize: 20,
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: Container(
                            height: context.height * 0.23,
                            width: context.width * 0.42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: isMale
                                    ? AppColors.kGreyColor
                                    : Colors.blueGrey),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                    female,
                                  ),
                                  height: 85,
                                  width: 85,
                                  // color: Colors.cyan,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('female')!,
                                  style: TextStyle(
                                    fontFamily: CairoFont,
                                    fontSize: 20,
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: context.height * 0.34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.kGreyColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.translate('hight')!,
                            style: TextStyle(
                                fontFamily: CairoFont,
                                fontSize: 20,
                                color: Colors.blue.shade900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${hight.round()}',
                                style: TextStyle(
                                    fontFamily: CairoFont,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900),
                              ),
                              Text(
                                AppLocalizations.of(context)!.translate('cm')!,
                                style: TextStyle(
                                    fontFamily: CairoFont,
                                    fontSize: 20,
                                    color: Colors.blue.shade900),
                              ),
                            ],
                          ),
                          Slider(
                              value: hight,
                              max: 205,
                              min: 10,
                              activeColor: Colors.cyan,
                              onChanged: (value) {
                                setState(() {
                                  hight = value;
                                });
                              })
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          height: context.height * 0.23,
                          width: context.width * 0.42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.kGreyColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate('weight')!,
                                style: TextStyle(
                                  fontFamily: CairoFont,
                                  fontSize: 20,
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$weight',
                                style: TextStyle(
                                    fontFamily: CairoFont,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    heroTag: 'weight-',
                                    mini: true,
                                    backgroundColor: Colors.cyan,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    heroTag: 'weight+',
                                    mini: true,
                                    backgroundColor: Colors.cyan,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.blue.shade900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: context.height * 0.23,
                          width: context.width * 0.42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.kGreyColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.translate('age')!,
                                style: TextStyle(
                                  fontFamily: CairoFont,
                                  fontSize: 20,
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$age',
                                style: TextStyle(
                                    fontFamily: CairoFont,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    heroTag: 'age-',
                                    mini: true,
                                    backgroundColor: Colors.cyan,
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    heroTag: 'age+',
                                    mini: true,
                                    backgroundColor: Colors.cyan,
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 60,
              width: context.width * 1,
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  double result = weight / pow(hight / 100, 2);
                  print(result.round());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BmiResultScreen(
                              weight: weight,
                              age: age,
                              result: result.round(),
                              isMale: isMale,
                              hight: hight.toInt(),
                            )),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Meter()),
                  // );
                },
                child: Text(
                  AppLocalizations.of(context)!.translate('calculate')!,
                  style: TextStyle(
                      fontFamily: CairoFont, color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
