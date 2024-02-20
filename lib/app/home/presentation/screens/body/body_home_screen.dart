import 'package:body_health/app/home/presentation/controller/home_cubit.dart';
import 'package:body_health/app/home/presentation/controller/home_states.dart';
import 'package:body_health/app/home/presentation/screens/body/models/gives_energy_weight_model.dart';
import 'package:body_health/app/home/presentation/screens/body/models/gives_vit_model.dart';
import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/components.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'body_details.dart';
import 'body_vitamins_screen.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BodyModel> BodyList = [
      BodyModel(
          image: givesVitamens,
          title:
              AppLocalizations.of(context)!.translate("Food gives vitamens")!,
          id: 1),
      BodyModel(
          image: gives_energy,
          title: AppLocalizations.of(context)!.translate("Food gives energy")!,
          id: 2),
      BodyModel(
          image: gainWeight,
          title: AppLocalizations.of(context)!.translate("For weight gain")!,
          id: 3),
    ];
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        BodyVitaData? bodyVitaModel =
            HomeCubit.get(context).bodyVitaModel?.bodyVitaData;
        BodyEnergyWeightData? bodyEnergyData =
            HomeCubit.get(context).bodyEnergyModel?.bodyEnergyWeightData;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * .1,
                  ),
                  SizedBox(
                    height: context.height * .9,
                    width: double.infinity,
                    child: ListView.separated(
                        itemBuilder: (context, index) => BodyCard(
                            BodyList[index],
                            bodyVitaModel!,
                            bodyEnergyData!,
                            index,
                            context),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 50,
                            ),
                        itemCount: BodyList.length),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

BodyCard(
        BodyModel model,
        BodyVitaData bodyVitaData,
        BodyEnergyWeightData bodyEnergyWeightData,
        int index,
        BuildContext context) =>
    GestureDetector(
      onTap: () {
        if (model.id == 1) {
          NavTo(
            context,
            BodyVitaminsDetails(
              bodyVitModel: bodyVitaData,
            ),
          );
        }
        if (model.id == 2) {
          NavTo(
            context,
            BodyDetails(
              bodyEnergyWeightModel: bodyEnergyWeightData,
              bodyModel: model,
            ),
          );
        }
        if (model.id == 3) {
          NavTo(
            context,
            BodyDetails(
              bodyEnergyWeightModel: bodyEnergyWeightData,
              bodyModel: model,
            ),
          );
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: context.height * .22,
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
                image: AssetImage(model.image),
                height: context.height * .22,
                width: context.width * .85,
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
            width: context.width * .85,
            color: Colors.white.withOpacity(.6),
            height: 30,
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: CairoFont,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue.shade900,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );

class BodyModel {
  final String image;
  final String title;

  final int id;
//   PageViewModel(this.image, this.title, );
  BodyModel({
    required this.image,
    required this.title,
    required this.id,
  });
}
