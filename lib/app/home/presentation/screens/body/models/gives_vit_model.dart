class BodyVitaModel {
  BodyVitaData? bodyVitaData;

  BodyVitaModel.fromJson(Map<String, dynamic> json) {
    bodyVitaData = json['body_GivesVita_data'] != null
        ? new BodyVitaData.fromJson(json['body_GivesVita_data'])
        : null;
  }
}

class BodyVitaData {
  List<VitaminAModel>? vitaminAModel;
  List<VitaminBModel>? vitaminBModel;
  List<VitaminDModel>? vitaminDModel;
  List<VitaminKModel>? vitaminKModel;

  BodyVitaData.fromJson(Map<String, dynamic> json) {
    if (json['vA'] != null) {
      vitaminAModel = <VitaminAModel>[];
      json['vA'].forEach((v) {
        vitaminAModel!.add(new VitaminAModel.fromJson(v));
      });
    }
    if (json['vB'] != null) {
      vitaminBModel = <VitaminBModel>[];
      json['vB'].forEach((v) {
        vitaminBModel!.add(new VitaminBModel.fromJson(v));
      });
    }
    if (json['vD'] != null) {
      vitaminDModel = <VitaminDModel>[];
      json['vD'].forEach((v) {
        vitaminDModel!.add(new VitaminDModel.fromJson(v));
      });
    }
    if (json['vK'] != null) {
      vitaminKModel = <VitaminKModel>[];
      json['vK'].forEach((v) {
        vitaminKModel!.add(new VitaminKModel.fromJson(v));
      });
    }
  }
}

class VitaminAModel {
  String? nameAr;
  String? nameEn;

  String? photo;

  VitaminAModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];

    photo = json['photo'];
  }
}

class VitaminBModel {
  String? nameAr;
  String? nameEn;

  String? photo;

  VitaminBModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];

    photo = json['photo'];
  }
}

class VitaminDModel {
  String? nameAr;
  String? nameEn;

  String? photo;

  VitaminDModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];

    photo = json['photo'];
  }
}

class VitaminKModel {
  String? nameAr;
  String? nameEn;

  String? photo;

  VitaminKModel.fromJson(Map<String, dynamic> json) {
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];

    photo = json['photo'];
  }
}
