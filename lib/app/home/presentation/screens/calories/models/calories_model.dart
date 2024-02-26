class CaloriesModel {
  CaloriesData? caloriesData;

  CaloriesModel.fromJson(Map<String, dynamic> json) {
    caloriesData = json['Calories_data'] != null
        ? new CaloriesData.fromJson(json['Calories_data'])
        : null;
  }
}

class CaloriesData {
  List<FruitModel>? fruitModel;
  List<NutsModel>? nutsModel;
  List<VegetablesModel>? vegetablesModel;

  CaloriesData.fromJson(Map<String, dynamic> json) {
    if (json['fruit'] != null) {
      fruitModel = <FruitModel>[];
      json['fruit'].forEach((v) {
        fruitModel!.add(new FruitModel.fromJson(v));
      });
    }
    if (json['nuts'] != null) {
      nutsModel = <NutsModel>[];
      json['nuts'].forEach((v) {
        nutsModel!.add(new NutsModel.fromJson(v));
      });
    }
    if (json['vegetables'] != null) {
      vegetablesModel = <VegetablesModel>[];
      json['vegetables'].forEach((v) {
        vegetablesModel!.add(new VegetablesModel.fromJson(v));
      });
    }
  }
}

class FruitModel {
  String? caloriesAr;
  String? nameAr;
  String? nameEn;
  String? caloriesEn;
  String? photo;

  FruitModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'] ?? "";
    nameEn = json['nameEn'] ?? "";
    caloriesAr = json['caloriesAr'] ?? "";
    caloriesEn = json['caloriesEn'] ?? "";
    photo = json['photo'] ?? "";
  }
}

class NutsModel {
  String? caloriesAr;
  String? nameAr;
  String? nameEn;
  String? caloriesEn;
  String? photo;

  NutsModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'] ?? "";
    nameEn = json['nameEn'] ?? "";
    caloriesAr = json['caloriesAr'] ?? "";
    caloriesEn = json['caloriesEn'] ?? "";
    photo = json['photo'] ?? "";
  }
}

class VegetablesModel {
  String? caloriesAr;
  String? nameAr;
  String? nameEn;
  String? caloriesEn;
  String? photo;

  VegetablesModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'] ?? "";
    nameEn = json['nameEn'] ?? "";
    caloriesAr = json['caloriesAr'] ?? "";
    caloriesEn = json['caloriesEn'] ?? "";
    photo = json['photo'] ?? "";
  }
}
