import 'package:body_health/app/home/presentation/screens/body/models/gives_energy_weight_model.dart';
import 'package:body_health/app/home/presentation/screens/body/models/gives_vit_model.dart';
import 'package:body_health/app/home/presentation/screens/calories/models/calories_model.dart';
import 'package:body_health/app/home/presentation/screens/food_system/models/food_systems_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  // final GetCharactersUseCase getcharactersUseCase;
  HomeCubit() : super(InitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  void uploadCaloriesData({
    List<Map<String, dynamic>>? fruit,
    List<Map<String, dynamic>>? nuts,
    List<Map<String, dynamic>>? vegetables,
  }) {
    emit(UploadCaloriesLoadingState());

    Map<String, dynamic> CaloriesDataMap = {
      'fruit': fruit,
      'nuts': nuts,
      'vegetables': vegetables,
    };
    try {
      FirebaseFirestore.instance
          .collection('calories')
          .doc('calories')
          .set({'Calories_data': CaloriesDataMap}).then((_) {
        print(' uploading data: succses ');
        emit(UploadCaloriesSuccessState());
      }).catchError((error) {
        print('Error uploading data: $error');
        emit(UploadCaloriesErrorState(error.toString()));
      });
    } catch (error) {
      emit(UploadCaloriesErrorState(error.toString()));
    }
  }

  void uploadGivesVitaData({
    List<Map<String, dynamic>>? vA,
    List<Map<String, dynamic>>? vB,
    List<Map<String, dynamic>>? vD,
    List<Map<String, dynamic>>? vK,
  }) {
    emit(UploadCaloriesLoadingState());

    Map<String, dynamic> body_GivesVita_DataMap = {
      'vA': vA,
      'vB': vB,
      'vD': vD,
      'vK': vK,
    };
    try {
      FirebaseFirestore.instance
          .collection('body_GivesVita')
          .doc('body_GivesVita')
          .set({'body_GivesVita_data': body_GivesVita_DataMap}).then((_) {
        print(' uploading data: succses ');
        emit(UploadCaloriesSuccessState());
      }).catchError((error) {
        print('Error uploading data: $error');
        emit(UploadCaloriesErrorState(error.toString()));
      });
    } catch (error) {
      emit(UploadCaloriesErrorState(error.toString()));
    }
  }

  void uploadGivesEnergyData({
    List<Map<String, dynamic>>? energyList,
    List<Map<String, dynamic>>? gainWeightList,
  }) {
    emit(UploadCaloriesLoadingState());

    Map<String, dynamic> body_GivesEnergy_Weight_DataMap = {
      'energy': energyList,
      'gainWeight': gainWeightList,
    };
    try {
      FirebaseFirestore.instance
          .collection('body_GivesEnergy_Weight')
          .doc('body_GivesEnergy_Weight')
          .set({
        'body_GivesEnergy_Weight_data': body_GivesEnergy_Weight_DataMap
      }).then((_) {
        print(' uploading data: succses ');
        emit(UploadCaloriesSuccessState());
      }).catchError((error) {
        print('Error uploading data: $error');
        emit(UploadCaloriesErrorState(error.toString()));
      });
    } catch (error) {
      emit(UploadCaloriesErrorState(error.toString()));
    }
  }

  void uploadUnderWeiData({
    List<Map<String, dynamic>>? FoodSystemsList,
  }) {
    emit(UploadCaloriesLoadingState());

    Map<String, dynamic> FoodSystemsList_DataMap = {
      'FoodSystemsList': FoodSystemsList,
    };
    try {
      FirebaseFirestore.instance
          .collection('FoodSystemsList')
          .doc('FoodSystemsList')
          .set({'FoodSystemsListData': FoodSystemsList_DataMap}).then((_) {
        print(' uploading data: succses ');
        emit(UploadCaloriesSuccessState());
      }).catchError((error) {
        print('Error uploading data: $error');
        emit(UploadCaloriesErrorState(error.toString()));
      });
    } catch (error) {
      emit(UploadCaloriesErrorState(error.toString()));
    }
  }

  CaloriesModel? caloriesModel;

  void GetCaloriesData() {
    emit(GetCaloriesLoadingState());
    FirebaseFirestore.instance
        .collection('calories')
        .doc('calories')
        .get()
        .then((value) {
      caloriesModel = CaloriesModel.fromJson(value.data()!);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value.data()}');
      // print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${westModel!.data!.photo}');

      print(
          'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${caloriesModel!.caloriesData?.nutsModel}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${CaloriesModel!.CaloriesData!.procedures}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${CaloriesModel!.CaloriesData!.symptoms[0]}');

      emit(GetCaloriesSucssesState());
    }).catchError((error) {
      print(
          'erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      emit(GetCaloriesErrorState(error.toString()));
    });
  }

  BodyVitaModel? bodyVitaModel;

  void GetBodyVitaData() {
    emit(GetBodyVitaLoadingState());
    FirebaseFirestore.instance
        .collection('body_GivesVita')
        .doc('body_GivesVita')
        .get()
        .then((value) {
      bodyVitaModel = BodyVitaModel.fromJson(value.data()!);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value.data()}');
      // print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${westModel!.data!.photo}');

      print(
          'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${bodyVitaModel!.bodyVitaData?.vitaminAModel}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${CaloriesModel!.CaloriesData!.procedures}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${CaloriesModel!.CaloriesData!.symptoms[0]}');

      emit(GetBodyVitaSucssesState());
    }).catchError((error) {
      print(
          'erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      emit(GetBodyVitaErrorState(error.toString()));
    });
  }

  BodyEnergyWeightModel? bodyEnergyModel;

  void GetBodyEnergyWeightData() {
    emit(GetBodyEnergyLoadingState());
    FirebaseFirestore.instance
        .collection('body_GivesEnergy_Weight')
        .doc('body_GivesEnergy_Weight')
        .get()
        .then((value) {
      bodyEnergyModel = BodyEnergyWeightModel.fromJson(value.data()!);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value.data()}');
      // print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${westModel!.data!.photo}');

      print(
          'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${bodyEnergyModel!.bodyEnergyWeightData?.energyModel}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${CaloriesModel!.CaloriesData!.procedures}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${CaloriesModel!.CaloriesData!.symptoms[0]}');

      emit(GetBodyEnergySucssesState());
    }).catchError((error) {
      print(
          'erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      emit(GetBodyEnergyErrorState(error.toString()));
    });
  }

  FoodSystemsFirebaseModel? foodSystemsModel;

  void GetFoodSystemsListData() {
    emit(GetunderWeightLoadingState());
    FirebaseFirestore.instance
        .collection('FoodSystemsList')
        .doc('FoodSystemsList')
        .get()
        .then((value) {
      foodSystemsModel = FoodSystemsFirebaseModel.fromJson(value.data()!);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${value.data()}');
      // print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${westModel!.data!.photo}');

      print(
          'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${foodSystemsModel!.foodSystemsListData?.foodSystemsListModel}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${CaloriesModel!.CaloriesData!.procedures}');
      // print(
      //     'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaa${CaloriesModel!.CaloriesData!.symptoms[0]}');

      emit(GetunderWeightSucssesState());
    }).catchError((error) {
      print(
          'erooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
      emit(GetunderWeightErrorState(error.toString()));
    });
  }
}
