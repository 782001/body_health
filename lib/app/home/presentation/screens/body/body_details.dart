import 'package:body_health/app/home/presentation/screens/body/body_home_screen.dart';
import 'package:body_health/app/home/presentation/screens/body/models/gives_energy_weight_model.dart';
import 'package:body_health/app/localization/presentation/cubit/locale_cubit.dart';
import 'package:body_health/core/utils/app_strings.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'body_lists.dart';

class BodyDetails extends StatelessWidget {
  const BodyDetails({
    Key? key,
    required this.bodyEnergyWeightModel,
    required this.bodyModel,
  }) : super(key: key);

  final BodyEnergyWeightData? bodyEnergyWeightModel;
  final BodyModel? bodyModel;
  @override
  Widget build(BuildContext context) {
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
                  height: context.height * .01,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: const BorderRadius.all(
                //       Radius.circular(10),
                //     ),
                //     color: Colors.green.shade900,
                //   ),
                //   width: context.width * .3,
                //   // height: context.height * .861
                //   child: const Center(
                //     child: Text(
                //       ' a ',
                //       style: TextStyle(   fontFamily: CairoFont,
                //fontWeight: FontWeight.bold,color: Colors.white, fontSize: 20),
                //     ),
                //   ),
                // ),
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: context.width * 0.01,
                          mainAxisSpacing: context.width * 0.017,
                          mainAxisExtent: context.height * 0.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          // int TouchIndex = DetailsList[index].id;
                          return DetailsCard(
                              bodyEnergyWeightModel!.energyModel![index],
                              bodyEnergyWeightModel!.weightModel![index],
                              bodyModel!,
                              index,
                              context);
                        },
                        itemCount: bodyModel!.id == 2
                            ? bodyEnergyWeightModel!.energyModel!.length
                            : bodyEnergyWeightModel!.weightModel!.length,
                        //       bodyModel.id == 1
                        //           ? EnergyDetailsList[index]
                        //           : bodyModel.id == 2
                        //               ? EnergyDetailsList[index]
                        //               : bodyModel.id == 3
                        //                   ? WeightDetailsList[index]
                        //                   : EnergyDetailsList[index],
                        //       index,
                        //       context);
                        // },
                        // itemCount: bodyModel.id == 1
                        //     ? EnergyDetailsList.length
                        //     : bodyModel.id == 2
                        //         ? EnergyDetailsList.length
                        //         : bodyModel.id == 3
                        //             ? WeightDetailsList.length
                        //             : EnergyDetailsList.length,
                        // itemCount: 3,
                        // Body: List.generate(ADetailsList.length,
                        //     (index) => HeroGridView(ADetailsList[index], context)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

DetailsCard(EnergyModel energymodel, WeightModel weightmodel,
        BodyModel bodyModel, int index, BuildContext context) =>
    Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: context.height * .15,
          width: context.width * .85,
          child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 4,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "${bodyModel.id == 2 ? energymodel.photo : weightmodel.photo}",
                  )
                  // width: double.infinity,
                  // fit: BoxFit.fill,
                  )),
        ),
        // Card(
        //   child: Image(
        //     image: AssetImage(model.image),
        //     width: 100,
        //     height: 100,
        //   ),
        // ),
        Container(
          width: context.width * .85,
          color: Colors.white.withOpacity(.6),
          // height: 30,
          child: Text(
            BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                    AppStrings.englishCode
                ? bodyModel.id == 2
                    ? energymodel.nameEn!
                    : weightmodel.nameEn!
                : bodyModel.id == 2
                    ? energymodel.nameAr!
                    : weightmodel.nameAr!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: CairoFont,
                color: Colors.blue.shade900,
                // overflow: TextOverflow.ellipsis,
                fontSize: 16),
          ),
        ),
      ],
    );
