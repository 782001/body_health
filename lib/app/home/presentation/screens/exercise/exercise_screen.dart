import 'package:body_health/app/home/presentation/controller/home_cubit.dart';
import 'package:body_health/app/home/presentation/controller/home_states.dart';
import 'package:body_health/app/home/presentation/screens/exercise/models/exercises_model.dart';
import 'package:body_health/app/localization/presentation/cubit/locale_cubit.dart';
import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/app_strings.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class ExercisesScreen extends StatelessWidget {
  ExercisesScreen({Key? key,required this.exercisesDataModel}) : super(key: key);
  final ExercisesData? exercisesDataModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height * .03,
                    ),

                    SizedBox(
                      height: context.height * .04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.blue.shade900,
                      ),
                      width: context.width * 1,
                      // height: context.height * .861
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.translate('Slimming')!,
                          style: TextStyle(
                              fontFamily: CairoFont,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        width: context.width * 1,
                        // height: context.height * .861,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // crossAxisCount: 3,
                            // mainAxisSpacing: 1,
                            // crossAxisSpacing: 1,
                            // childAspectRatio: 1 / 1.7,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: context.width * 0.01,
                              mainAxisSpacing: context.width * 0.017,
                              mainAxisExtent: context.height * 0.2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              // int TouchIndex = SlimmingDetailsList[index].id;
                              return SlimmingDetailsCard(
                                  exercisesDataModel!.slimmingModel![index],
                                  index,
                                  context);
                            },
                            itemCount: exercisesDataModel!.slimmingModel!.length,
                            // itemCount: 3,
                            // children: List.generate(SlimmingDetailsList.length,
                            //     (index) => HeroGridView(SlimmingDetailsList[index], context)),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.blue.shade900,
                      ),
                      width: context.width * 1,
                      // height: context.height * .861
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.translate('Weight_stabilization')!,
                          style: TextStyle(
                              fontFamily: CairoFont,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: context.height * .01,
                    // ),
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        width: context.width * 1,
                        // height: context.height * .861,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // crossAxisCount: 3,
                            // mainAxisSpacing: 1,
                            // crossAxisSpacing: 1,
                            // childAspectRatio: 1 / 1.7,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: context.width * 0.01,
                              mainAxisSpacing: context.width * 0.017,
                              mainAxisExtent: context.height * 0.2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Weight_stabilizationDetailsCard(
                                  exercisesDataModel!.weight_stabilizationModel![index],
                                  index,
                                  context);
                            },
                            itemCount: exercisesDataModel!.weight_stabilizationModel!.length,
                            // itemCount: 3,
                            // children: List.generate(SlimmingDetailsList.length,
                            //     (index) => HeroGridView(SlimmingDetailsList[index], context)),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.blue.shade900,
                      ),
                      width: context.width * 1,
                      // height: context.height * .861
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate('vegetabels')!,
                          style: TextStyle(
                              fontFamily: CairoFont,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: context.height * .01,
                    // ),
                 ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// class SlimmingModel {
//   final String image;

//   final String title;

//   final int id;
// //   PageViewModel(this.image, this.title, );
//   SlimmingModel({
//     required this.image,
//     required this.title,
//     required this.id,
//   });
// }

SlimmingDetailsCard(SlimmingModel model, int index, BuildContext context) =>
    Container(
      // height: context.height * .15,
      // width: context.width * .85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(.2), width: 2),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          //   ),
          //   child: Image.asset(
          //     HeroIconModel.icon,
          //     height: context.height * 0.2,
          //     width: context.width * .7,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          SizedBox(
            height: context.height * .12,
            width: context.width * .85,
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "${model.photo}",
                    )
                    // width: double.infinity,
                    // fit: BoxFit.fill,
                    )
                // Image.asset(
                //   HeroIconModel.image,
                //   fit: BoxFit.cover,
                // ),
                ),
          ),
          SizedBox(
            height: context.height * 0.013,
          ),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                // height: context.height * 0.08,
                // width: context.width * .3,
                child: Center(
                  child: Text(
                    BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                            AppStrings.englishCode
                        ? model.nameEn!
                        : model.nameAr!,
                    style: TextStyle(
                        fontFamily: CairoFont,
                        color: Colors.blue.shade900,
                        // fontSize: context.height * 0.017,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          // Center(
          //   child: Align(
          //     alignment: Alignment.center,
          //     child: SizedBox(
          //       // height: context.height * 0.08,
          //       // width: context.width * .3,
          //       child: Center(
          //         child: Text(
          //           BlocProvider.of<LocaleCubit>(context).currentLangCode ==
          //                   AppStrings.englishCode
          //               ? model.ExercisesEn!
          //               : model.ExercisesAr!,
          //           style: TextStyle(
          //               fontFamily: CairoFont,
          //               color: Colors.blue.shade900,
          //               // fontSize: context.height * 0.017,
          //               fontSize: 14,
          //               fontStyle: FontStyle.italic,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
       
        ],
      ),
    );

Weight_stabilizationDetailsCard(Weight_stabilizationModel model, int index, BuildContext context) => Container(
      // height: context.height * .15,
      // width: context.width * .85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(.2), width: 2),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          //   ),
          //   child: Image.asset(
          //     HeroIconModel.icon,
          //     height: context.height * 0.2,
          //     width: context.width * .7,
          //     fit: BoxFit.fill,
          //   ),
          // ),
          SizedBox(
            height: context.height * .12,
            width: context.width * .85,
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "${model.photo}",
                    )
                    // width: double.infinity,
                    // fit: BoxFit.fill,
                    )
                // Image.asset(
                //   HeroIconModel.image,
                //   fit: BoxFit.cover,
                // ),
                ),
          ),
          SizedBox(
            height: context.height * 0.013,
          ),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                // height: context.height * 0.08,
                // width: context.width * .3,
                child: Center(
                  child: Text(
                    BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                            AppStrings.englishCode
                        ? model.nameEn!
                        : model.nameAr!,
                    style: TextStyle(
                        fontFamily: CairoFont,
                        color: Colors.blue.shade900,
                        // fontSize: context.height * 0.017,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

       ],
      ),
    );

