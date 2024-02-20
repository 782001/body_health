class FoodSystemsFirebaseModel {
  FoodSystemsListData? foodSystemsListData;

  FoodSystemsFirebaseModel.fromJson(Map<String, dynamic> json) {
    foodSystemsListData = json['FoodSystemsListData'] != null
        ? new FoodSystemsListData.fromJson(json['FoodSystemsListData'])
        : null;
  }
}

class FoodSystemsListData {
  List<FoodSystemsListModel>? foodSystemsListModel;

  FoodSystemsListData.fromJson(Map<String, dynamic> json) {
    if (json['FoodSystemsList'] != null) {
      foodSystemsListModel = <FoodSystemsListModel>[];
      json['FoodSystemsList'].forEach((v) {
        foodSystemsListModel!.add(new FoodSystemsListModel.fromJson(v));
      });
    }
  }
}

class FoodSystemsListModel {
  String? Day1BreakfastEn;
  String? Day1BreakfastAr;
  String? Day1LunchAr;
  String? Day1LunchEn;
  String? Day1DinnerEn;
  String? Day1DinnerAr;
  String? Day2BreakfastEn;
  String? Day2BreakfastAr;
  String? Day2LunchAr;
  String? Day2LunchEn;
  String? Day2DinnerEn;
  String? Day2DinnerAr;
  String? Day3BreakfastEn;
  String? Day3BreakfastAr;
  String? Day3LunchAr;
  String? Day3LunchEn;
  String? Day3DinnerEn;
  String? Day3DinnerAr;

  FoodSystemsListModel.fromJson(Map<String, dynamic> json) {
    Day1BreakfastEn = json['Day1BreakfastEn'];
    Day1BreakfastAr = json['Day1BreakfastAr'];

    Day1LunchAr = json['Day1LunchAr'];
    Day1LunchEn = json['Day1LunchEn'];
    Day1DinnerEn = json['Day1DinnerEn'];
    Day1DinnerAr = json['Day1DinnerAr'];
    Day2BreakfastEn = json['Day2BreakfastEn'];
    Day2BreakfastAr = json['Day2BreakfastAr'];

    Day2LunchAr = json['Day2LunchAr'];
    Day2LunchEn = json['Day2LunchEn'];
    Day2DinnerEn = json['Day2DinnerEn'];
    Day2DinnerAr = json['Day2DinnerAr'];
    Day3BreakfastEn = json['Day3BreakfastEn'];
    Day3BreakfastAr = json['Day3BreakfastAr'];

    Day3LunchAr = json['Day3LunchAr'];
    Day3LunchEn = json['Day3LunchEn'];
    Day3DinnerEn = json['Day3DinnerEn'];
    Day3DinnerAr = json['Day3DinnerAr'];
  }
}
