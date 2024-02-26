class ExercisesModel {
  ExercisesData? exercisesData;

  ExercisesModel.fromJson(Map<String, dynamic> json) {
    exercisesData = json['exercise_data'] != null
        ? new ExercisesData.fromJson(json['exercise_data'])
        : null;
  }
}

class ExercisesData {
  List<SlimmingModel>? slimmingModel;
  List<Weight_stabilizationModel>? weight_stabilizationModel;
  

  ExercisesData.fromJson(Map<String, dynamic> json) {
    if (json['slimming'] != null) {
      slimmingModel = <SlimmingModel>[];
      json['slimming'].forEach((v) {
        slimmingModel!.add(new SlimmingModel.fromJson(v));
      });
    }
    if (json['weight_stabilization'] != null) {
      weight_stabilizationModel = <Weight_stabilizationModel>[];
      json['weight_stabilization'].forEach((v) {
        weight_stabilizationModel!.add(new Weight_stabilizationModel.fromJson(v));
      });
    }
   
  }
}

class SlimmingModel {
  String? nameAr;
  String? nameEn;

  String? photo;

  SlimmingModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr']??"";
    nameEn = json['nameEn']??"";

    photo = json['photo']??"";
  }
}

class Weight_stabilizationModel {

  String? nameAr;
  String? nameEn;

  String? photo;

  Weight_stabilizationModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr']??"";
    nameEn = json['nameEn']??"";
   
    photo = json['photo']??"";
  }
}

