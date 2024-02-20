class BodyEnergyWeightModel {
  BodyEnergyWeightData? bodyEnergyWeightData;

  BodyEnergyWeightModel.fromJson(Map<String, dynamic> json) {
    bodyEnergyWeightData = json['body_GivesEnergy_Weight_data'] != null
        ? new BodyEnergyWeightData.fromJson(
            json['body_GivesEnergy_Weight_data'])
        : null;
  }
}

class BodyEnergyWeightData {
  List<EnergyModel>? energyModel;
  List<WeightModel>? weightModel;

  BodyEnergyWeightData.fromJson(Map<String, dynamic> json) {
    if (json['energy'] != null) {
      energyModel = <EnergyModel>[];
      json['energy'].forEach((v) {
        energyModel!.add(new EnergyModel.fromJson(v));
      });
    }
    if (json['gainWeight'] != null) {
      weightModel = <WeightModel>[];
      json['gainWeight'].forEach((v) {
        weightModel!.add(new WeightModel.fromJson(v));
      });
    }
  }
}

class EnergyModel {
  String? nameAr;
  String? nameEn;

  String? photo;

  EnergyModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];

    photo = json['photo'];
  }
}

class WeightModel {
  String? nameAr;
  String? nameEn;

  String? photo;

  WeightModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];

    photo = json['photo'];
  }
}
