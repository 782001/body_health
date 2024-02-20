import 'package:body_health/app/home/presentation/screens/body/models/gives_vit_model.dart';
import 'package:body_health/app/localization/presentation/cubit/locale_cubit.dart';
import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/app_strings.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'body_lists.dart';

class BodyVitaminsDetails extends StatelessWidget {
  const BodyVitaminsDetails({Key? key, required this.bodyVitModel})
      : super(key: key);
  final BodyVitaData? bodyVitModel;
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
                      AppLocalizations.of(context)!.translate('Vitamin a')!,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: context.width * 0.01,
                          mainAxisSpacing: context.width * 0.017,
                          mainAxisExtent: context.height * 0.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return VitaminADetailsCard(
                              bodyVitModel!.vitaminAModel![index],
                              index,
                              context);
                        },
                        itemCount: bodyVitModel!.vitaminAModel!.length,
                        // itemCount: 3,
                        // Body: List.generate(VitaminADetailsList.length,
                        //     (index) => HeroGridView(VitaminADetailsList[index], context)),
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
                      AppLocalizations.of(context)!.translate('Vitamin b')!,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: context.width * 0.01,
                          mainAxisSpacing: context.width * 0.017,
                          mainAxisExtent: context.height * 0.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return VitaminBDetailsCard(
                              bodyVitModel!.vitaminBModel![index],
                              index,
                              context);
                        },
                        itemCount: bodyVitModel!.vitaminBModel!.length,
                        // itemCount: 3,
                        // Body: List.generate(VitaminADetailsList.length,
                        //     (index) => HeroGridView(VitaminADetailsList[index], context)),
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
                      AppLocalizations.of(context)!.translate('Vitamin c')!,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: context.width * 0.01,
                          mainAxisSpacing: context.width * 0.017,
                          mainAxisExtent: context.height * 0.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return VitaminDDetailsCard(
                              bodyVitModel!.vitaminDModel![index],
                              index,
                              context);
                        },
                        itemCount: bodyVitModel!.vitaminDModel!.length,
                        // itemCount: 3,
                        // Body: List.generate(VitaminADetailsList.length,
                        //     (index) => HeroGridView(VitaminADetailsList[index], context)),
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
                      AppLocalizations.of(context)!.translate('Vitamin k')!,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: context.width * 0.01,
                          mainAxisSpacing: context.width * 0.017,
                          mainAxisExtent: context.height * 0.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return VitaminKDetailsCard(
                              bodyVitModel!.vitaminKModel![index],
                              index,
                              context);
                        },
                        itemCount: bodyVitModel!
                            .vitaminKModel!.length, // itemCount: 3,
                        // Body: List.generate(VitaminADetailsList.length,
                        //     (index) => HeroGridView(VitaminADetailsList[index], context)),
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

VitaminADetailsCard(VitaminAModel model, int index, BuildContext context) =>
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
                    "${model.photo}",
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
          height: 30,
          child: Text(
            BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                    AppStrings.englishCode
                ? model.nameEn!
                : model.nameAr!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: CairoFont,
                color: Colors.blue.shade900,
                overflow: TextOverflow.ellipsis,
                fontSize: 18),
          ),
        ),
      ],
    );

VitaminBDetailsCard(VitaminBModel model, int index, BuildContext context) =>
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
                    "${model.photo}",
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
          height: 30,
          child: Text(
            BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                    AppStrings.englishCode
                ? model.nameEn!
                : model.nameAr!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: CairoFont,
                color: Colors.blue.shade900,
                overflow: TextOverflow.ellipsis,
                fontSize: 16),
          ),
        ),
      ],
    );

VitaminDDetailsCard(VitaminDModel model, int index, BuildContext context) =>
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
                    "${model.photo}",
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
          height: 30,
          child: Text(
            BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                    AppStrings.englishCode
                ? model.nameEn!
                : model.nameAr!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: CairoFont,
                color: Colors.blue.shade900,
                overflow: TextOverflow.ellipsis,
                fontSize: 18),
          ),
        ),
      ],
    );

VitaminKDetailsCard(VitaminKModel model, int index, BuildContext context) =>
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
                    "${model.photo}",
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
          height: 30,
          child: Text(
            BlocProvider.of<LocaleCubit>(context).currentLangCode ==
                    AppStrings.englishCode
                ? model.nameEn!
                : model.nameAr!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: CairoFont,
                color: Colors.blue.shade900,
                overflow: TextOverflow.ellipsis,
                fontSize: 18),
          ),
        ),
      ],
    );
