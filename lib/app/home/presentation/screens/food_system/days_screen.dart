import 'package:body_health/app/home/presentation/screens/food_system/day_screen.dart';
import 'package:body_health/app/home/presentation/screens/food_system/food_systems.dart';
import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/components.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import 'models/food_systems_model.dart';

class DaysScreen extends StatelessWidget {
  DaysScreen(
      {Key? key, required this.customModel, required this.foodSystemModel})
      : super(key: key);
  final FoodSystemsModel customModel;
  final FoodSystemsListData foodSystemModel;
  @override
  Widget build(BuildContext context) {
    List<DaysModel> DaysList = [
      DaysModel(
          image: day1,
          title: AppLocalizations.of(context)!.translate('Day one')!,
          id: 1),
      DaysModel(
          image: day2,
          title: AppLocalizations.of(context)!.translate('Day Two')!,
          id: 2),
      DaysModel(
          image: day3,
          title: AppLocalizations.of(context)!.translate('Day Three')!,
          id: 3),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            customModel.discreption,
            style: TextStyle(
                fontFamily: CairoFont,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * .9,
                width: double.infinity,
                child: ListView.separated(
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => DaysCard(
                        DaysList[index], customModel, foodSystemModel, context),
                    separatorBuilder: (context, index) => SizedBox(
                          height: context.height * 0.01,
                        ),
                    itemCount: DaysList.length),
              ),
            ],
          ),
        ));
  }
}

Widget DaysCard(DaysModel model, FoodSystemsModel customModel,
    FoodSystemsListData foodSystemsListModel, BuildContext context) {
  return InkWell(
    onTap: () {
      NavTo(
          context,
          DayScreen(
            customModel: customModel,
            foodSystemsListModel: foodSystemsListModel,
            daysModel: model,
          ));
    },
    child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 5),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: context.width * 1,
          height: context.height * .28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffD04641),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
              // Image(
              //   image: AssetImage(model.image),
              //   width: context.width * .22,
              //   height: 190,
              //   fit: BoxFit.contain,
              // ),
              const Spacer(),
              const SizedBox(
                height: 15,
              ),
              Text(
                model.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: CairoFont,
                    fontStyle: FontStyle.italic),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    ),
  );
}

class DaysModel {
  final String image;
  final String title;

  final int id;

//   PageViewModel(this.image, this.title, );
  DaysModel({
    required this.image,
    required this.title,
    required this.id,
  });
}
