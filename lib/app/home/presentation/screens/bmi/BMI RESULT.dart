import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/app_theme_colors.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiResultScreen extends StatelessWidget {
  final int result;
  final int age;
  final int weight;
  final bool isMale;
  final int hight;

  BmiResultScreen({
    required this.result,
    required this.age,
    required this.weight,
    required this.isMale,
    required this.hight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kGreyColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //  leading: IconButton(
      //    onPressed: (){
      //      Navigator.pop(context);
      //    },

      //    icon:const Icon(Icons.keyboard_arrow_left),
      //  ),
      //   title: const Text(
      //     'RESULT',
      //     style: TextStyle(   fontFamily: CairoFont,
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 50,
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 0, endValue: 17, color: Colors.white),
                          GaugeRange(
                              startValue: 17,
                              endValue: 25,
                              color: Colors.green),
                          GaugeRange(
                              startValue: 25,
                              endValue: 30,
                              color: Colors.yellow),
                          GaugeRange(
                              startValue: 30,
                              endValue: 35,
                              color: Colors.orange),
                          GaugeRange(
                              startValue: 35, endValue: 40, color: Colors.red),
                          GaugeRange(
                              startValue: 40,
                              endValue: 50,
                              color: Colors.purple)
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: result.toDouble())
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  child: Text(result.toString(),
                                      style: TextStyle(
                                          fontFamily: CairoFont,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))),
                              angle: 90,
                              positionFactor: 0.5)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${isMale ? "Male" : "Female"}',
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    ' | ',
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '$weight Kg',
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    ' | ',
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '$hight cm',
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    ' | ',
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '$age yr',
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Text(
                '${AppLocalizations.of(context)!.translate('you are')!}  ${result <= 18.5 ? AppLocalizations.of(context)!.translate('Underweight')! : result >= 18.5 && result <= 24.9 ? AppLocalizations.of(context)!.translate('Normal')! : result >= 24.9 && result <= 29.9 ? AppLocalizations.of(context)!.translate('Overweight')! : AppLocalizations.of(context)!.translate('obesity')!}',
                style: TextStyle(
                  fontFamily: CairoFont,
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
