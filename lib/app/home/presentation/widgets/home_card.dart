import 'package:body_health/app/home/presentation/screens/bmi/bmi_screen.dart';
import 'package:body_health/app/home/presentation/screens/body/body_home_screen.dart';
import 'package:body_health/app/home/presentation/screens/calories/calories.dart';
import 'package:body_health/app/home/presentation/screens/chat_gpt/chat_page.dart';
import 'package:body_health/app/home/presentation/screens/food_system/food_systems.dart';
import 'package:body_health/app/home/presentation/screens/home_screen.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../screens/calories/models/calories_model.dart';
import '../screens/exercise/exercise_screen.dart';
import '../screens/exercise/models/exercises_model.dart';

HomeCard(HomeModel model, CaloriesData caloriesData,
        ExercisesData exercisesData, int index, BuildContext context) =>
    InkWell(
      onTap: () {
        if (model.id == 2) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BmiScreen(),
              ));
        }
        if (model.id == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyHomeScreen(),
              ));
        }
        if (model.id == 3) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FoodSystems(),
              ));
        }
        if (model.id == 4) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CaloriesScreen(caloriesDataModel: caloriesData),
                // CaloriesScreen(caloriesDataModel: caloriesData),
              ));
        }
        if (model.id == 6) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ExercisesScreen(exercisesDataModel: exercisesData),
              ));
        }
        if (model.id == 5) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(),
              ));
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: context.height * .22,
            width: context.width * .5,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 50,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image(
                image: AssetImage(model.image),
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Card(
          //   child: Image(
          //     image: AssetImage(model.image),
          //     width: 100,
          //     height: 100,
          //   ),
          // ),

          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            width: context.width * .42,
            height: 30,
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: CairoFont,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
