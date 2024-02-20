import 'package:body_health/app/home/presentation/controller/home_cubit.dart';
import 'package:body_health/app/home/presentation/controller/home_states.dart';
import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/components.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'days_screen.dart';
import 'models/food_systems_model.dart';

class FoodSystems extends StatelessWidget {
  const FoodSystems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<FoodSystemsModel> FoodSystemsList = [
      FoodSystemsModel(
        discreption: AppLocalizations.of(context)!.translate("Overweight")!,
        image: fatMan,
        title: "Food system for",
        id: 1,
        day1Breakfast: "Green Power \n1 Hard-boiled egg",
        day1Lunch:
            "Chicken\nWhite Bean Sup\n 1 Whole Wheat baguette\n 1 apple ,medium",
        day1Dinner: "Slow Cooker \nChicken curry \n 1 Cup brown rice,cooked",
        day2Breakfast: "Vanilla Fresh \n Toast Bake \n 1 cup fresh Berries",
        day2Lunch: "Slow Cooker \nChicken curry \n1 medium orange ",
        day2Dinner: "Superfood \n Quinoa Bowl\n 1 cup steamed asparagus",
        day3Breakfast: "Overnight  \nOatmeal",
        day3Lunch:
            "SunShine Slad w/\n Orange \n Marmalade\n Vinaigrette\n15 Carrots& 1 Tbsp . hummus",
        day3Dinner:
            "Southwestern\n Quinoa Stuffed peppers\n 1 Cup Roasted Parmesan Green Beans",
      ),
      FoodSystemsModel(
        discreption: AppLocalizations.of(context)!.translate("Underweight")!,
        image: WeakMan,
        title: "Food system for",
        id: 2,
        day1Breakfast:
            "Ham & cheese omlet prepared in 1 Tbs olive oil  \n(2 eggs , 1oz ,ham ,1/4 cheese)\n Cranberry juice (1c)\n 413 cal,18gm pro",
        day1Lunch:
            "Barbeque (2 Tbs ) chicken (3.5 oz)\npotato salad (1/2 c)\n Fruit (1/2 c)\n Whole milk(1 c)\n 587 cal , 32 gm pro",
        day1Dinner:
            "Spaghetti with meatballs (1-1.5 c) \nGarlic bread (1 slice) \nFruit (1/2 c)\n Whole milk (1 c)\n 615 cal, 26 gm pro",
        day2Breakfast:
            "Waffles (1) with butter (1 Tbs) & syrup (2 Tob)\n Greek yogurt with fruit (1 single serve container)\n Whole milk (1c)\n 664 cal, 22 gm pro",
        day2Lunch:
            "Ham salad sandwich (1/2 c on 2 pc bread)\n Edamame (1/2 c)\n Whole milk (1c)\n 710 cal, 35 gm pro ",
        day2Dinner:
            "Lasagna (1/2 c)\n Roll (1) with butter (1 Tbs) \nWhole milk (1c)\n 608 cal, 24 gm pro",
        day3Breakfast:
            "Scrambled eggs (1 large)\n Toast (1 slice) with butter (1 Tbs) & Jelly (1 Tbs).\n Fruit juice (1/2 c) 284 cal, 10 gm pro",
        day3Lunch:
            "Cheeseburger with bun (1 sand)\n Fries (1 small serving)\n Chocolate milk shake (1c)\n 1031 cal, 40 gm pro",
        day3Dinner:
            "Salmon (1 sm fillet) prepared in butter (1 Tbs)\n Rice (1/2 c)\n Broccoli (1/2 c)\n Whole milk (1c)\n 595 cal, 55 gm pro",
      ),
      FoodSystemsModel(
        discreption: AppLocalizations.of(context)!.translate("Normal")!,
        image: normal_man,
        title: "Food system for",
        id: 3,
        day1Breakfast: "1 bowl of poha or daliya with vegetable",
        day1Lunch:
            "1-2 chapatis,\n 1 small bowl of dal,\n 1 small bowl of sabzi \n(carrot-caulifower- peas) and 1 bowl of curd",
        day1Dinner:
            "1-2 chapatis,\n 1 small bowl of dal and 1 small bowl of sabzi (palak paneer)",
        day2Breakfast: "Oats porridge (with skimmed milk) and fruits",
        day2Lunch:
            "1 chapati, \n1 small bowl of methi dal,\n 1/2 small bowl rice, \n1 small bowl of sabzi (okra),\n and 1 bowl of vegetable salad",
        day2Dinner:
            "1-2 chapatis,  \n1 small bowl of dal  \nand 1 small bowl of sabzi (bottle gourd)",
        day3Breakfast: "2 brown rice idlis with sambhar",
        day3Lunch:
            "1 bajra roti.\n 1 small bowl of dal\n 1 small bowl of sabzi (brinjal) \nand 1 bowl of vegetable salad",
        day3Dinner:
            "Mixed vegetable salad topped with nuts, and grilled low-fat paneer",
      ),
    ];

    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      FoodSystemsListData? foodSystemsListData =
          HomeCubit.get(context).foodSystemsModel?.foodSystemsListData;
      return Scaffold(
        appBar: AppBar(
          leading: Container(),
          centerTitle: true,
          title: Text(
            "",
            style: TextStyle(
                fontFamily: CairoFont,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FirstFoodSystemsCard(context),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: context.height * .8,
                width: double.infinity,
                child: ListView.separated(
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FoodSystemsCard(
                        FoodSystemsList[index], foodSystemsListData!, context),
                    separatorBuilder: (context, index) => SizedBox(
                          height: context.height * 0.01,
                        ),
                    itemCount: FoodSystemsList.length),
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget FoodSystemsCard(FoodSystemsModel custommodel,
    FoodSystemsListData foodSystemsListDataModel, BuildContext context) {
  return GestureDetector(
    onTap: () {
      NavTo(
          context,
          DaysScreen(
            foodSystemModel: foodSystemsListDataModel,
            customModel: custommodel,
          ));
    },
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 5),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            // width: context.width * 1,
            // height: context.height * .12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Image(
                      image: AssetImage(custommodel.image),
                      width: context.width * .2,
                      height: context.height * .16,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   model.title,
                          //   style: const TextStyle(fontFamily: CairoFont,
                          //       color: Color.fromARGB(255, 223, 116, 59),
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 20),
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            custommodel.discreption,
                            maxLines: 3,
                            style: TextStyle(
                                fontFamily: CairoFont,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Positioned(
                  bottom: 2.0,
                  left: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.shade400,
                      child: const Icon(
                        Icons.keyboard_double_arrow_left_rounded,
                        color: Colors.white,
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

Widget FirstFoodSystemsCard(BuildContext context) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 5),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          // width: context.width * 1,
          // height: context.height * .12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple,
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image(
                    image: AssetImage(FitnesMan),
                    width: context.width * .22,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .translate("Eating systems")!,
                          style: TextStyle(
                              fontFamily: CairoFont,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!.translate("For")!,
                          style: TextStyle(
                              fontFamily: CairoFont,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          AppLocalizations.of(context)!.translate("the body")!,
                          style: TextStyle(
                              fontFamily: CairoFont,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class FoodSystemsModel {
  final String image;
  final String title;
  final String discreption;
  final int id;
  final String day1Breakfast;
  final String day1Lunch;
  final String day1Dinner;
  final String day2Breakfast;
  final String day2Lunch;
  final String day2Dinner;
  final String day3Breakfast;
  final String day3Lunch;
  final String day3Dinner;
//   PageViewModel(this.image, this.title, );
  FoodSystemsModel({
    required this.image,
    required this.title,
    required this.discreption,
    required this.id,
    required this.day1Breakfast,
    required this.day1Lunch,
    required this.day1Dinner,
    required this.day2Breakfast,
    required this.day2Lunch,
    required this.day2Dinner,
    required this.day3Breakfast,
    required this.day3Lunch,
    required this.day3Dinner,
  });
}
