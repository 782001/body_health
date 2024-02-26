import 'package:body_health/app/home/presentation/screens/food_system/models/food_systems_model.dart';
import 'package:body_health/app/localization/presentation/cubit/locale_cubit.dart';
import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/app_strings.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'days_screen.dart';
import 'food_systems.dart';

class DayScreen extends StatelessWidget {
  const DayScreen(
      {Key? key,
      required this.customModel,
      required this.daysModel,
      required this.foodSystemsListModel})
      : super(key: key);
  final FoodSystemsModel customModel;
  final FoodSystemsListData foodSystemsListModel;
  final DaysModel daysModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          daysModel.title,
          style: TextStyle(
            fontFamily: CairoFont,
            color: Colors.blue.shade900,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitle(
                  AppLocalizations.of(context)!.translate("the breakfast")!),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(
                      color: const Color.fromARGB(255, 221, 171, 239),
                      width: 4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    // a conditional expression to display one of the variables based on id
                    customModel.id == 1
                        ? daysModel.id == 1
                            ? BlocProvider.of<LocaleCubit>(context)
                                        .currentLangCode ==
                                    AppStrings.englishCode
                                ? foodSystemsListModel.foodSystemsListModel![0]
                                        .Day1BreakfastEn ??
                                    ""
                                : foodSystemsListModel.foodSystemsListModel![0]
                                        .Day1BreakfastAr ??
                                    ""
                            : daysModel.id == 2
                                ? BlocProvider.of<LocaleCubit>(context)
                                            .currentLangCode ==
                                        AppStrings.englishCode
                                    ? foodSystemsListModel
                                            .foodSystemsListModel![0]
                                            .Day2BreakfastEn ??
                                        ""
                                    : foodSystemsListModel
                                            .foodSystemsListModel![0]
                                            .Day2BreakfastAr ??
                                        ""
                                : daysModel.id == 3
                                    ? BlocProvider.of<LocaleCubit>(context)
                                                .currentLangCode ==
                                            AppStrings.englishCode
                                        ? foodSystemsListModel
                                                .foodSystemsListModel![0]
                                                .Day3BreakfastEn ??
                                            ""
                                        : foodSystemsListModel
                                                .foodSystemsListModel![0]
                                                .Day3BreakfastAr ??
                                            ""
                                    : ''
                        : customModel.id == 2
                            ? daysModel.id == 1
                                ? BlocProvider.of<LocaleCubit>(context)
                                            .currentLangCode ==
                                        AppStrings.englishCode
                                    ? foodSystemsListModel.foodSystemsListModel![1].Day1BreakfastEn ?? ""
                                    : foodSystemsListModel.foodSystemsListModel![1].Day1BreakfastAr ?? ""
                                : daysModel.id == 2
                                    ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                        ? foodSystemsListModel.foodSystemsListModel![1].Day2BreakfastEn ?? ""
                                        : foodSystemsListModel.foodSystemsListModel![1].Day2BreakfastAr ?? ""
                                    : daysModel.id == 3
                                        ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                            ? foodSystemsListModel.foodSystemsListModel![1].Day3BreakfastEn ?? ""
                                            : foodSystemsListModel.foodSystemsListModel![1].Day3BreakfastAr ?? ""
                                        : ''
                            : customModel.id == 3
                                ? daysModel.id == 1
                                    ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                        ? foodSystemsListModel.foodSystemsListModel![2].Day1BreakfastEn ?? ""
                                        : foodSystemsListModel.foodSystemsListModel![2].Day1BreakfastAr ?? ""
                                    : daysModel.id == 2
                                        ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                            ? foodSystemsListModel.foodSystemsListModel![2].Day2BreakfastEn ?? ""
                                            : foodSystemsListModel.foodSystemsListModel![2].Day2BreakfastAr ?? ""
                                        : daysModel.id == 3
                                            ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                                ? foodSystemsListModel.foodSystemsListModel![2].Day3BreakfastEn ?? ""
                                                : foodSystemsListModel.foodSystemsListModel![2].Day3BreakfastAr ?? ""
                                            : ''
                                : "",
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildTitle(
                  AppLocalizations.of(context)!.translate("the lunch")!),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(
                      color: const Color.fromARGB(255, 221, 171, 239),
                      width: 4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    // a conditional expression to display one of the variables based on id
                    customModel.id == 1
                        ? daysModel.id == 1
                            ? BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                                    AppStrings.englishCode
                                ? foodSystemsListModel.foodSystemsListModel![0].Day1LunchEn ??
                                    ""
                                : foodSystemsListModel.foodSystemsListModel![0].Day1LunchAr ??
                                    ""
                            : daysModel.id == 2
                                ? BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                                        AppStrings.englishCode
                                    ? foodSystemsListModel
                                            .foodSystemsListModel![0]
                                            .Day2LunchEn ??
                                        ""
                                    : foodSystemsListModel
                                            .foodSystemsListModel![0]
                                            .Day2LunchAr ??
                                        ""
                                : daysModel.id == 3
                                    ? BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                                            AppStrings.englishCode
                                        ? foodSystemsListModel
                                                .foodSystemsListModel![0]
                                                .Day3LunchEn ??
                                            ""
                                        : foodSystemsListModel
                                                .foodSystemsListModel![0]
                                                .Day3LunchAr ??
                                            ""
                                    : ''
                        : customModel.id == 2
                            ? daysModel.id == 1
                                ? BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                                        AppStrings.englishCode
                                    ? foodSystemsListModel
                                            .foodSystemsListModel![1]
                                            .Day1LunchEn ??
                                        ""
                                    : foodSystemsListModel
                                            .foodSystemsListModel![1]
                                            .Day1LunchAr ??
                                        ""
                                : daysModel.id == 2
                                    ? BlocProvider.of<LocaleCubit>(context)
                                                .currentLangCode ==
                                            AppStrings.englishCode
                                        ? foodSystemsListModel.foodSystemsListModel![1].Day2LunchEn ?? ""
                                        : foodSystemsListModel.foodSystemsListModel![1].Day2LunchAr ?? ""
                                    : daysModel.id == 3
                                        ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                            ? foodSystemsListModel.foodSystemsListModel![1].Day3LunchEn ?? ""
                                            : foodSystemsListModel.foodSystemsListModel![1].Day3LunchAr ?? ""
                                        : ''
                            : customModel.id == 3
                                ? daysModel.id == 1
                                    ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                        ? foodSystemsListModel.foodSystemsListModel![2].Day1LunchEn ?? ""
                                        : foodSystemsListModel.foodSystemsListModel![2].Day1LunchAr ?? ""
                                    : daysModel.id == 2
                                        ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                            ? foodSystemsListModel.foodSystemsListModel![2].Day2LunchEn ?? ""
                                            : foodSystemsListModel.foodSystemsListModel![2].Day2LunchAr ?? ""
                                        : daysModel.id == 3
                                            ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                                ? foodSystemsListModel.foodSystemsListModel![2].Day3LunchEn ?? ""
                                                : foodSystemsListModel.foodSystemsListModel![2].Day3LunchAr ?? ""
                                            : ''
                                : "",
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontSize: 20,
                    ), // a default value in case id is not 1, 2, or 3
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _buildTitle(AppLocalizations.of(context)!.translate("dinner")!),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(
                      color: const Color.fromARGB(255, 221, 171, 239),
                      width: 4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    // a conditional expression to display one of the variables based on id
                    customModel.id == 1
                        ? daysModel.id == 1
                            ? BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                                    AppStrings.englishCode
                                ? foodSystemsListModel.foodSystemsListModel![0]
                                        .Day1DinnerEn ??
                                    ""
                                : foodSystemsListModel.foodSystemsListModel![0]
                                        .Day1DinnerAr ??
                                    ""
                            : daysModel.id == 2
                                ? BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                                        AppStrings.englishCode
                                    ? foodSystemsListModel
                                            .foodSystemsListModel![0]
                                            .Day2DinnerEn ??
                                        ""
                                    : foodSystemsListModel
                                            .foodSystemsListModel![0]
                                            .Day2DinnerAr ??
                                        ""
                                : daysModel.id == 3
                                    ? BlocProvider.of<LocaleCubit>(context)
                                                .currentLangCode ==
                                            AppStrings.englishCode
                                        ? foodSystemsListModel
                                                .foodSystemsListModel![0]
                                                .Day3DinnerEn ??
                                            ""
                                        : foodSystemsListModel
                                                .foodSystemsListModel![0]
                                                .Day3DinnerAr ??
                                            ""
                                    : ''
                        : customModel.id == 2
                            ? daysModel.id == 1
                                ? BlocProvider.of<LocaleCubit>(context)
                                            .currentLangCode ==
                                        AppStrings.englishCode
                                    ? foodSystemsListModel.foodSystemsListModel![1].Day1DinnerEn ?? ""
                                    : foodSystemsListModel.foodSystemsListModel![1].Day1DinnerAr ?? ""
                                : daysModel.id == 2
                                    ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                        ? foodSystemsListModel.foodSystemsListModel![1].Day2DinnerEn ?? ""
                                        : foodSystemsListModel.foodSystemsListModel![1].Day2DinnerAr ?? ""
                                    : daysModel.id == 3
                                        ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                            ? foodSystemsListModel.foodSystemsListModel![1].Day3DinnerEn ?? ""
                                            : foodSystemsListModel.foodSystemsListModel![1].Day3DinnerAr ?? ""
                                        : ''
                            : customModel.id == 3
                                ? daysModel.id == 1
                                    ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                        ? foodSystemsListModel.foodSystemsListModel![2].Day1DinnerEn ?? ""
                                        : foodSystemsListModel.foodSystemsListModel![2].Day1DinnerAr ?? ""
                                    : daysModel.id == 2
                                        ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                            ? foodSystemsListModel.foodSystemsListModel![2].Day2DinnerEn ?? ""
                                            : foodSystemsListModel.foodSystemsListModel![2].Day2DinnerAr ?? ""
                                        : daysModel.id == 3
                                            ? BlocProvider.of<LocaleCubit>(context).currentLangCode == AppStrings.englishCode
                                                ? foodSystemsListModel.foodSystemsListModel![2].Day3DinnerEn ?? ""
                                                : foodSystemsListModel.foodSystemsListModel![2].Day3DinnerAr ?? ""
                                            : ''
                                : "",
                    style: const TextStyle(
                      fontFamily: CairoFont,
                      color: Colors.black,
                      fontSize: 20,
                    ), // a default value in case id is not 1, 2, or 3
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTitle(String text) {
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 58, 192, 176),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: CairoFont,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}
