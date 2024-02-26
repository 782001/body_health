import 'package:body_health/app/app_cubit/cubit.dart';
import 'package:body_health/app/home/presentation/screens/body/models/gives_vit_model.dart';
import 'package:body_health/app/home/presentation/screens/calories/models/calories_model.dart';
import 'package:body_health/app/home/presentation/controller/home_cubit.dart';
import 'package:body_health/app/home/presentation/controller/home_states.dart';
import 'package:body_health/app/home/presentation/screens/exercise/models/exercises_model.dart';
import 'package:body_health/app/home/presentation/widgets/home_card.dart';
import 'package:body_health/app/home/presentation/widgets/mydrawer.dart';
import 'package:body_health/app/localization/presentation/cubit/locale_cubit.dart';
import 'package:body_health/config/locale/app_localizations.dart';
import 'package:body_health/core/utils/app_strings.dart';
import 'package:body_health/core/utils/assets_path.dart';
import 'package:body_health/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeModel> HomeList = [
      HomeModel(
          image: body_healthImage,
          title: AppLocalizations.of(context)!.translate("Body Health")!,
          id: 1),
      HomeModel(
          image: bmiImage,
          title: AppLocalizations.of(context)!.translate('BMI')!,
          id: 2),
      HomeModel(
          image: Food_systemsImage,
          title: AppLocalizations.of(context)!.translate("Food system")!,
          id: 3),
      HomeModel(
          image: CaloriesImage,
          title: AppLocalizations.of(context)!.translate("Calories")!,
          id: 4),
      HomeModel(
          image: chat_gptImage,
          title: AppLocalizations.of(context)!.translate("chatGpt")!,
          id: 5),
      HomeModel(
          image: exercises,
          title: AppLocalizations.of(context)!.translate("exercises")!,
          id: 6),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      drawerScrimColor: Colors.transparent,
      // drawerScrimColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.blue.shade900,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),

      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = HomeCubit.get(context);
          CaloriesData? caloriesModel =
              HomeCubit.get(context).caloriesModel?.caloriesData;
          ExercisesData? exercisesModel =
              HomeCubit.get(context).exercisesModel?.exercisesData;

          return SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: context.height * 0.02,
                // ),
                Text(
                  "Health Care",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: CairoFont,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // IconButton(
                //     onPressed: () {
                //       HomeCubit.get(context).uploadUnderWeiData(
                //         FoodSystemsList: FoodSystemsList,
                //       );
                //     },
                //     icon: Icon(
                //       Icons.abc,
                //       color: Colors.amber,
                //     )),
                // IconButton(
                //     onPressed: () {
                //       HomeCubit.get(context).uploadGivesVitaData(
                //         vA: VADataList,
                //         vB: VBDataList,
                //         vD: VDDataList,
                //         vK: VKDataList,
                //       );
                //     },
                //     icon: Icon(
                //       Icons.abc,
                //       color: Colors.amber,
                //     )),

                // IconButton(
                //     onPressed: () {
                //       HomeCubit.get(context). uploadExerciseData(slimming: exersicesSlimmingDetailsList,

                //         weight_stabilization: exersicesStablizationDetailsList,
                //       );
                //     },
                //     icon: Icon(
                //       Icons.abc,
                //       color: Colors.amber,
                //     )),

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
                          crossAxisCount: 2,
                          crossAxisSpacing: context.width * 0.01,
                          mainAxisSpacing: context.width * 0.1,
                          mainAxisExtent: context.height * 0.24,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          int TouchIndex = HomeList[index].id;
                          return HomeCard(HomeList[index], caloriesModel!,
                              exercisesModel!, index, context);
                        },
                        itemCount: HomeList.length,
                        // itemCount: 3,
                        // children: List.generate(SlimmingDetailsList.length,
                        //     (index) => HeroGridView(SlimmingDetailsList[index], context)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeModel {
  final String image;
  final String title;
  final int id;
//   PageViewModel(this.image, this.title, );
  HomeModel({
    required this.image,
    required this.title,
    required this.id,
  });
}

List<Map<String, dynamic>> FruitDataList = [
  {
    'nameAr': 'كيوي ',
    'nameEn': 'Kiwi ',
    'caloriesAr': '49 سعر حراري',
    'caloriesEn': '49 calories',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Kiwi%2049%20calories%20%20%D9%83%D9%8A%D9%88%D9%8A%20%D9%A4%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=94139d5b-35a7-4fa8-8915-970b59cbcfa6',
  },
  {
    'nameAr': 'مانجو',
    'nameEn': 'Mango ',
    'caloriesAr': '60 سعر حراري',
    'caloriesEn': '60 calories',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Mango%2060%20calories%20%20%D9%85%D8%A7%D9%86%D8%AC%D9%88%20%D9%A6%D9%A0%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=6a0f1d0a-9032-490c-b256-80c516ffcc28',
  },
  {
    'nameAr': 'برقوق ',
    'nameEn': 'plum ',
    'caloriesAr': '32 سعر حراري',
    'caloriesEn': '32 calories',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/plum%2032%20calories%20%D8%A8%D8%B1%D9%82%D9%88%D9%82%20%D9%A3%D9%A2%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=3bffa6a2-6659-4884-a2d2-b3ee1d196755',
  },
  {
    'nameAr': 'فراوله',
    'nameEn': 'strawberry ',
    'caloriesAr': '28 سعر حراري',
    'caloriesEn': '28 calories',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/strawberry%2028%20calories%20%D9%81%D8%B1%D8%A7%D9%88%D9%84%D9%87%20%D9%A2%D9%A8%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.png?alt=media&token=4144c6ec-f4ea-4ead-b044-8cc05d246825',
  },
];

List<Map<String, dynamic>> vegetablesDataList = [
  {
    'nameAr': 'كرفس ',
    'nameEn': 'calery',
    'caloriesAr': '8 سعر حراري',
    'caloriesEn': '8 calories',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/celery%208%20calories%20%D9%83%D8%B1%D9%81%D8%B3%20%D9%A8%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=1e7f1397-7e48-4410-9138-023ad4dc087b',
  },
  {
    'nameAr': 'الباميه ',
    'nameEn': 'okra ',
    'caloriesAr': '33 سعر حراري',
    'caloriesEn': '33 calories',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/okra%2033%20calories%20%20%D8%A7%D9%84%D8%A8%D8%A7%D9%85%D9%8A%D9%87%20%D9%A3%D9%A3%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=a93e0f58-e567-422b-a9c0-7639e5e1e152',
  },
  {
    'nameAr': 'البصل ',
    'nameEn': 'Onions ',
    'caloriesAr': '81 سعر حراري',
    'caloriesEn': '81 calories',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Onions%2081%20calories%20%20%D8%A7%D9%84%D8%A8%D8%B5%D9%84%20%D9%A8%D9%A1%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=acd3639c-33a8-414a-9b08-4a2b9c4df784',
  },
  {
    'nameAr': 'الفلفل الاحمر',
    'nameEn': 'red papper',
    'caloriesAr': '28 سعر حراري',
    'caloriesEn': '28 calories',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/red%20papper%2028%20calories%20%D8%A7%D9%84%D9%81%D9%84%D9%81%D9%84%20%D8%A7%D9%84%D8%A7%D8%AD%D9%85%D8%B1%20%D9%A2%D9%A8%D8%B3%D8%B9%D8%B1%20%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=229f02dd-899c-4ed1-9845-ab590b77bb12',
  },

  // Add more items as needed
];

List<Map<String, dynamic>> NutsDataList = [
  {
    'nameAr': "البندق ",
    'nameEn': "hazelnut ",
    'caloriesAr': '656 سعر حراري',
    'caloriesEn': '656 calories',
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/hazelnut%20656%20calories%20%D8%A7%D9%84%D8%A8%D9%86%D8%AF%D9%82%20%D9%A6%D9%A5%D9%A6%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=859d7ac1-549d-45db-b816-fb7f565e5f38",
  },
  {
    'nameAr': "الفول ",
    'nameEn': "peanuts ",
    'caloriesAr': '90 سعر حراري',
    'caloriesEn': '90 calories',
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/peanuts%2090%20calories%20%D8%A7%D9%84%D9%81%D9%88%D9%84%20%D9%A9%D9%A0%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=8bc5fb00-ea03-479a-a02b-84e20eaa6d7d",
  },
  {
    'nameAr': "فسدق ",
    'nameEn': "pistachios ",
    'caloriesAr': '30 سعر حراري',
    'caloriesEn': '30 calories',
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/pistachios%2030%20calories%20%D9%81%D8%B3%D8%AF%D9%82%20%D9%A3%D9%A0%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=2dc2f301-39a0-4ebe-b51b-f3b311019798",
  },
  {
    'nameAr': "الكاجو ",
    'nameEn': "walnuts ",
    'caloriesAr': '639 سعر حراري',
    'caloriesEn': '639 calories',
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/walnuts%20639%20calories%20%D8%A7%D9%84%D9%83%D8%A7%D8%AC%D9%88%20%D9%A6%D9%A3%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=25269566-6094-4388-ab5d-3f784edd6c21",
  },
  // Add more items as needed
];
//////////////////////////////
//// exersices//////
List<Map<String, dynamic>> exersicesSlimmingDetailsList = [
  {
    'nameAr': 'تمارين الحبل ',
    'nameEn': 'Rope Exercises ',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Kiwi%2049%20calories%20%20%D9%83%D9%8A%D9%88%D9%8A%20%D9%A4%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=94139d5b-35a7-4fa8-8915-970b59cbcfa6',
  },
  {
    'nameAr': ' الجري ',
    'nameEn': 'Running ',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Kiwi%2049%20calories%20%20%D9%83%D9%8A%D9%88%D9%8A%20%D9%A4%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=94139d5b-35a7-4fa8-8915-970b59cbcfa6',
  },
  {
    'nameAr': 'تدريب الأوزان  ',
    'nameEn': 'Weight Training ',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Kiwi%2049%20calories%20%20%D9%83%D9%8A%D9%88%D9%8A%20%D9%A4%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=94139d5b-35a7-4fa8-8915-970b59cbcfa6',
  },
  {
    'nameAr': 'ركوب الدراجات',
    'nameEn': 'Cycling ',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Kiwi%2049%20calories%20%20%D9%83%D9%8A%D9%88%D9%8A%20%D9%A4%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=94139d5b-35a7-4fa8-8915-970b59cbcfa6',
  },
];
List<Map<String, dynamic>> exersicesStablizationDetailsList = [
  {
    'nameAr': ' تمرين شد البطن ',
    'nameEn': 'Abdominal Stretching Exercise',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Kiwi%2049%20calories%20%20%D9%83%D9%8A%D9%88%D9%8A%20%D9%A4%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=94139d5b-35a7-4fa8-8915-970b59cbcfa6',
  },
  {
    'nameAr': ' تمرين عضلات الأرداف وتقوية الركبة ',
    'nameEn': 'Buttock Muscle Exercise and Knee Strengthening ',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Kiwi%2049%20calories%20%20%D9%83%D9%8A%D9%88%D9%8A%20%D9%A4%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=94139d5b-35a7-4fa8-8915-970b59cbcfa6',
  },
  {
    'nameAr': 'تمرين تمديد القدم',
    'nameEn': 'Foot Stretching Exercise',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Kiwi%2049%20calories%20%20%D9%83%D9%8A%D9%88%D9%8A%20%D9%A4%D9%A9%20%D8%B3%D8%B9%D8%B1%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=94139d5b-35a7-4fa8-8915-970b59cbcfa6',
  },
];

//  //  //  //  //  //  //  //
List<Map<String, dynamic>> VADataList = [
  {
    'nameAr': "زبده ",
    'nameEn': "butter",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/butter%20%D8%B2%D8%A8%D8%AF%D9%87.jpg?alt=media&token=98399dd3-2f2b-422b-900f-bca8e566b551",
  },
  {
    'nameAr': "جزر ",
    'nameEn': "carrot",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/carrot%20%D8%AC%D8%B2%D8%B1.jpg?alt=media&token=68dcae48-9a6c-45a3-ae7b-798ad62070c8"
  },
  {
    'nameAr': "مانجو ",
    'nameEn': "Mango",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/Mango%20%20%D9%85%D8%A7%D9%86%D8%AC%D9%88%20.jpg?alt=media&token=ee5ad444-5068-4ce5-830f-8487b10b3beb"
  },
  {
    'nameAr': "الفلفل الاحمر",
    'nameEn': "red Pepper",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/red%20papper%2028%20calories%20%D8%A7%D9%84%D9%81%D9%84%D9%81%D9%84%20%D8%A7%D9%84%D8%A7%D8%AD%D9%85%D8%B1%20%D9%A2%D9%A8%D8%B3%D8%B9%D8%B1%20%20%D8%AD%D8%B1%D8%A7%D8%B1%D9%8A.jpg?alt=media&token=39f02393-a20f-48e8-949c-985a731abf7e"
  },
  {
    'nameAr': "سبانخ ",
    'nameEn': "spinach ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/spinach%20%D8%B3%D8%A8%D8%A7%D9%86%D8%AE.jpg?alt=media&token=d30ed3aa-311f-456d-ae9b-4e26523d5b84"
  },
  {
    'nameAr': "تونه ",
    'nameEn': "tuna",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/tuna%20%D8%AA%D9%88%D9%86%D9%87.jpg?alt=media&token=6c22fd66-666a-419c-b7c9-0e8c91df142e"
  },
  // Add more items as needed
];
List<Map<String, dynamic>> VBDataList = [
  {
    'nameAr': "اللوز ",
    'nameEn': "almonds",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/almonds%20%D8%A7%D9%84%D9%84%D9%88%D8%B2.jpg?alt=media&token=68ee20dc-651b-4a26-a1d7-ca29bb0410eb"
  },
  {
    'nameAr': "فراخ ",
    'nameEn': "chicken",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/chicken%20%D9%81%D8%B1%D8%A7%D8%AE.png?alt=media&token=70a1836e-08cf-4e48-a41e-24cf72a8d68b"
  },
  {
    'nameAr': "البيض ",
    'nameEn': "eggs",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/eggs%20%D8%A7%D9%84%D8%A8%D9%8A%D8%B6.jpg?alt=media&token=5a9f90b2-ad3c-4282-8d8d-569a3055789c",
  },
  {
    'nameAr': "سمك",
    'nameEn': "fish",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/fish.%20%D8%B3%D9%85%D9%83.jpg?alt=media&token=ae51529e-3c7c-4e03-ac40-4e7abd3f993e",
  },
  {
    'nameAr': "لبن ",
    'nameEn': "milk",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/milk%20%D9%84%D8%A8%D9%86.png?alt=media&token=6ba693ab-2399-414d-8c9a-f7fc9f121b01",
  },
  {
    'nameAr': "اللحمه الحمراء",
    'nameEn': "red meat",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/red%20meat%20%D8%A7%D9%84%D9%84%D8%AD%D9%85%D9%87%20%D8%A7%D9%84%D8%AD%D9%85%D8%B1%D8%A7%D8%A1.jpg?alt=media&token=5fec8b87-4762-4595-a350-b2f4f3789298",
  },
];
List<Map<String, dynamic>> VDDataList = [
  {
    'nameAr': "زبده",
    'nameEn': "butter",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/butter%20%D8%B2%D8%A8%D8%AF%D9%87.jpg?alt=media&token=ebeca65c-9bc4-4cc7-8a98-46851e6bedf1",
  },
  {
    'nameAr': "بيض",
    'nameEn': "eggs.",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/eggs.%20%D8%A8%D9%8A%D8%B6.png?alt=media&token=8d04318c-3b6e-4593-a368-a2887683c980",
  },
  {
    'nameAr': "مشروم",
    'nameEn': "mashrum ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/red%20meat%20%D8%A7%D9%84%D9%84%D8%AD%D9%85%D9%87%20%D8%A7%D9%84%D8%AD%D9%85%D8%B1%D8%A7%D8%A1.jpg?alt=media&token=5fec8b87-4762-4595-a350-b2f4f3789298",
  },
  {
    'nameAr': "لبن",
    'nameEn': "milk ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/milk%20%D9%84%D8%A8%D9%86.png?alt=media&token=926d22c8-6cbb-41f9-90cf-4d8fa1c95ca4",
  },

  {
    'nameAr': "سالمون",
    'nameEn': "salmon ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/salmon%20%D8%B3%D8%A7%D9%84%D9%85%D9%88%D9%86.jpg?alt=media&token=9cee2c01-cfe8-4d9f-8669-703866ee93ff",
  },
  {
    'nameAr': "زبادي",
    'nameEn': "yogurt ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/yogurt%20%D8%B2%D8%A8%D8%A7%D8%AF%D9%8A.jpg?alt=media&token=d297529f-1b77-4924-b10c-19fa0b36c1e7",
  },
  // Add more items as needed
];
List<Map<String, dynamic>> VKDataList = [
  {
    'nameAr': "كرنب",
    'nameEn': "cabbage ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/cabbage%20%D9%83%D8%B1%D9%85%D8%A8.jpg?alt=media&token=059c6ba0-e908-45de-8cc4-bab3b50200da",
  },
  {
    'nameAr': "خيار ",
    'nameEn': "cucumber ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/cucumber%20%D8%AE%D9%8A%D8%A7%D8%B1.jpg?alt=media&token=4775512f-a160-43bd-8732-37aa992539e0",
  },
  {
    'nameAr': " بسله",
    'nameEn': "green beans",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/green%20beans%20%D8%A8%D8%B3%D9%84%D9%87.jpg?alt=media&token=4a532b7b-0e60-41a0-8512-d4c9ea673a57",
  },
  {
    'nameAr': " خس",
    'nameEn': "lettuce",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/lettuce%20%D8%AE%D8%B3.jpg?alt=media&token=dc55391c-532e-496a-a8c4-e4f7bdc276b2",
  },
  {
    'nameAr': "الباميه ",
    'nameEn': "okra",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/%D8%A7%D9%84%D8%A8%D8%A7%D9%85%D9%8A%D9%87%20okra.jpg?alt=media&token=6441db11-7039-49eb-8f18-be18208c7733",
  },
];
List<Map<String, dynamic>> EnergyDataList = [
  {
    'nameAr': " اللوز",
    'nameEn': "almonds ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/almonds%20%D8%A7%D9%84%D9%84%D9%88%D8%B2.jpg?alt=media&token=1c40e904-ee9d-4137-b700-927db8d462aa"
  },
  {
    'nameAr': " تفاح ",
    'nameEn': "apple ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/apple%20%D8%AA%D9%81%D8%A7%D8%AD.jpg?alt=media&token=7ef9f2d2-2ad7-462e-926a-17671cb89d47",
  },
  {
    'nameAr': "موز",
    'nameEn': "banana",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/banana%20%D9%85%D9%88%D8%B2.jpg?alt=media&token=cbcf11b4-3bad-4bac-8d03-0495a77f2c17",
  },
  {
    'nameAr': "البيض",
    'nameEn': "eggs",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/eggs%20%D8%A7%D9%84%D8%A8%D9%8A%D8%B6.jpg?alt=media&token=812d0dc0-05c7-4659-907b-510c8fe0b13c",
  },
  {
    'nameAr': "العسل",
    'nameEn': "honey",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/honey%20%D8%A7%D9%84%D8%B9%D8%B3%D9%84.jpg?alt=media&token=be3503e1-063a-4aa5-b9e2-9a2ec598c159",
  },
  {
    'nameAr': "سبانخ ",
    'nameEn': "spinach",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/spinach%20%D8%B3%D8%A8%D8%A7%D9%86%D8%AE.jpg?alt=media&token=b72e8d21-dc84-4ee7-9040-f47b94c08d83",
  },
  {
    'nameAr': "القمح",
    'nameEn': "oats",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/oats%20%D8%A7%D9%84%D9%82%D9%85%D8%AD.jpg?alt=media&token=7d9bfa44-a169-4263-a186-c6dab2dd1841",
  },
];
List<Map<String, dynamic>> gainWeightList = [
  {
    'nameAr': "  افوكادو",
    'nameEn': "avocado ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/avocado%20%D8%A7%D9%81%D9%88%D9%83%D8%A7%D8%AF%D9%88.jpg?alt=media&token=64a7e904-f3ad-494f-876a-2c88dfceb99a"
  },
  {
    'nameAr': "  زبده ",
    'nameEn': "butter ",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/butter%20%D8%B2%D8%A8%D8%AF%D9%87.jpg?alt=media&token=fd8cc47b-eb93-44a7-985e-4310f35f9e5d"
  },
  {
    'nameAr': "الشوكولاته الداكنه",
    'nameEn': "dark chocolate",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/dark%20chocolate%20%D8%A7%D9%84%D8%B4%D9%88%D9%83%D9%88%D9%84%D8%A7%D8%AA%D9%87%20%D8%A7%D9%84%D8%AF%D8%A7%D9%83%D9%86%D9%87.jpg?alt=media&token=18e8d6a8-32ae-4410-94ea-3b012acb037e"
  },
  {
    'nameAr': "زبده الفول",
    'nameEn': "nuts butter",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/nuts%20butter%20%D8%B2%D8%A8%D8%AF%D9%87%20%D8%A7%D9%84%D9%81%D9%88%D9%84.jpg?alt=media&token=9d952447-09ab-47f2-bcda-74f9e191c658"
  },
  {
    'nameAr': " المكسرات",
    'nameEn': "nuts",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/nuts%20%D8%A7%D9%84%D9%85%D9%83%D8%B3%D8%B1%D8%A7%D8%AA.jpg?alt=media&token=cde45f44-2368-4566-8615-4d917b128aba"
  },
  {
    'nameAr': " مكرونه ",
    'nameEn': "pasta",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/pasta%20%D9%85%D9%83%D8%B1%D9%88%D9%86%D9%87.jpg?alt=media&token=5f2d02bd-425b-4ee8-a8c1-6e2769f0dc37"
  },
  {
    'nameAr': " بطاطس",
    'nameEn': "potatoes",
    'photo':
        "https://firebasestorage.googleapis.com/v0/b/body-health-5ac4e.appspot.com/o/potatoes%20%D8%A8%D8%B7%D8%A7%D8%B7%D8%B3.jpg?alt=media&token=e244c521-2cdc-4001-9e64-d1a691e85869"
  },
];

List<Map<String, dynamic>> FoodSystemsList = [
  {
    'Day1BreakfastEn': "Two boiled eggs with two cucumbers",
    'Day1BreakfastAr': "بيضتان مسلوقتان مع حبتي خيار",
    'Day1LunchAr':
        "قطعة دجاج مشوية أو مسلوقة بدون جلد مع ملعقة لبن ممزوجة ببذر الكتان",
    'Day1LunchEn':
        "A piece of grilled or boiled skinless chicken with a spoonful of milk mixed with flax seeds",
    'Day1DinnerEn': " Two boiled eggs with a plate of vegetable salad",
    'Day1DinnerAr': "بيضتان مسلوقتان مع طبق سلطة خضار",
    'Day2BreakfastEn':
        " Two boiled eggs with a slice of mortadella and a cucumber",
    'Day2BreakfastAr': "بيضتان مسلوقتان مع شريحة مرتديلا وحبة خيار",
    'Day2LunchAr': "علبة تونا  بدون زيت مغسولة بالماء مع الخل وحبتا كيوي",
    'Day2LunchEn':
        " A can of tuna in water without oil, washed in water with vinegar and two kiwis",
    'Day2DinnerEn': " Add fat-free milk",
    'Day2DinnerAr': "علبة لبن خال من الدسم",
    'Day3BreakfastEn':
        " Two boiled eggs with a slice of mortadella and a cucumber",
    'Day3BreakfastAr': "بيضتان مسلوقتان مع شريحة مرتديلا وحبة خيار",
    'Day3LunchAr': "قطعة لحم مشوية أو مسلوقة مع طبق سلطة خضار",
    'Day3LunchEn':
        " A piece of grilled or boiled meat with a vegetable salad plate",
    'Day3DinnerEn': "A carton of fat-free milk",
    'Day3DinnerAr': "علبة لبن خال من الدسم",
  },
  {
    'Day1BreakfastEn': "Carrot juice + Egg sandwich",
    'Day1BreakfastAr': "عصير جزر + سندوتش بيض ",
    'Day1LunchAr': "قطعة دجاج + سلطة + برتقالة",
    'Day1LunchEn': " A piece of chicken + salad + orange",
    'Day1DinnerEn': "Yogurt and a piece of bread",
    'Day1DinnerAr': "زيادي + نصف قطعة خبز",
    'Day2BreakfastEn': "Orange juice + Cheese sandwich",
    'Day2BreakfastAr': "عصير برتقال + سندوتش جبن",
    'Day2LunchAr': "قطعة سمك + نصف كوب معكرونة",
    'Day2LunchEn': " A piece of fish + Half a cup of pasta",
    'Day2DinnerEn': "Soft + half a piece of bread + apple",
    'Day2DinnerAr': "لبنة + نصف قطعة خبر + تفاحة",
    'Day3BreakfastEn': "Pineapple juice + Egg sandwich",
    'Day3BreakfastAr': "عصير أناناس + سندوتش بيض ",
    'Day3LunchAr': "قطعة لحم + سلطة + نصف كوب رز",
    'Day3LunchEn': " A piece of meat + salad + Half a cup of rice",
    'Day3DinnerEn': " Two gins + juice + Half a piece of bread",
    'Day3DinnerAr': "حبتين جين + عصير + نصف قطعة خبز بر",
  },
  {
    'Day1BreakfastEn': "eggs and bacon and coffe",
    'Day1BreakfastAr': "بيض ولحم مشوي و قهوه",
    'Day1LunchAr': "فراخ و فاصوليا بيضاء وتفاح",
    'Day1LunchEn': "chicken and white bean soup and apple",
    'Day1DinnerEn': "cup of brown rice cocked and yogurt ",
    'Day1DinnerAr': " ارز بني مطبوخ و زبادي",
    'Day2BreakfastEn': " cereal and muesli and fresh fruits   ",
    'Day2BreakfastAr': "رقائق الزرة و موسلي و فاكهه طازجة",
    'Day2LunchAr': " دجاج كاري مطبوخ ببطئ و برتقاله متوسطة",
    'Day2LunchEn': "slow cooker chicken curry and medium orange",
    'Day2DinnerEn': "grilled salmon and halloumi cheese and yogurt",
    'Day2DinnerAr': "سلمون مشوي وجبنة حلومي وزبادي",
    'Day3BreakfastEn': "toast with cheese and fresh tomato and lettuce",
    'Day3BreakfastAr': "خبز محمص بالجبنة و طماطم طازجة و خس",
    'Day3LunchAr': "مكرونة التونة المخبوزة و جبنة البارميزان",
    'Day3LunchEn': "baked tuna pasta and parmesan cheese",
    'Day3DinnerEn': "white salad onion and rice cracker and yogurt",
    'Day3DinnerAr': "سلطة بصل بيضاء و ارز متكسر و زبادي",
  },
];

// List<Map<String, dynamic>> FoodSystemsList = [
//   {
//     'Day1BreakfastEn': "bowl of poha or daliya vegetable",
//     'Day1BreakfastAr': "وعاء بوها او خضار يوميا",
//     'Day1LunchAr': "بوله صغيرة من الدال و بوله صغيرة من الجزر",
//     'Day1LunchEn': "small bowl of dal and small bowl of carrot",
//     'Day1DinnerEn': "chapatis and small bowl of palak paneer",
//     'Day1DinnerAr': "شاباتي و بةله صغيرة من بلاك بانير",
//     'Day2BreakfastEn': "dats parridge and fruits and skimmed milk",
//     'Day2BreakfastAr': "باردج داتس و فاكهه و حليب منزوع الدسم",
//     'Day2LunchAr':
//         "بوله صغيرة من ميثيدال و نص بوله ارز وبوله  صغيرة من الباميه",
//     'Day2LunchEn':
//         "small bowl of okra  small bowl of methidal and 1/2 bowl rice and",
//     'Day2DinnerEn': "chapatis and small bowl of bottle gourd",
//     'Day2DinnerAr': "شاباتي و نص بوله من زجاجة القرع",
//     'Day3BreakfastEn': "2 brown rice idlis with sambhar and 1apple",
//     'Day3BreakfastAr': "2ايديليس ارز بني و 1 تفاجه",
//     'Day3LunchAr': "1 باجرا روتي و بوله سلطه خضرةوات",
//     'Day3LunchEn': "1 bajra roti and 1 bowl of vegetable salad",
//     'Day3DinnerEn':
//         "mixed vegetable salad topped with nuts and grilled low fat paneer",
//     'Day3DinnerAr':
//         "خليط من سلطه الخضروات ممزوجه  بالمكسرات و بانيه مشوي قليل الدسم ",
//   },
//   {
//     'Day1BreakfastEn': "ham and cheese and eggs and cranberry juice",
//     'Day1BreakfastAr': "لحم و جبنة و بيض وعصير توت",
//     'Day1LunchAr': "لحم مشوي و سلطة بطاطس و فاكهه و حليب صافي",
//     'Day1LunchEn': "barbeque chiken and potato salad and fruit and whole milk",
//     'Day1DinnerEn': "spaghetti  and garlic bread and fruit and whole milk",
//     'Day1DinnerAr': "سباجتي و خبز بالثوم و فاكهه و حليب صافي ",
//     'Day2BreakfastEn': "waffles and syrup and  yogurt  and whole milk",
//     'Day2BreakfastAr': "طير و شراب مركز و زبادي و حليب صافي",
//     'Day2LunchAr': "ساندويتش سلطة لحم و ادامامي و حليب صافي",
//     'Day2LunchEn': "ham salad sandwich and edamame and whole milk",
//     'Day2DinnerEn': "lasagna and roll and whole milk",
//     'Day2DinnerAr': "لازنيا و رول و حليب صافي",
//     'Day3BreakfastEn':
//         "scrambled eggs and one peace of toast and jelly and fruit juice",
//     'Day3BreakfastAr': "بيض مضروب و قطعة خبز محمص و جلس و عصسر فواكه",
//     'Day3LunchAr': "برجر الجبن وبطاطس مقلية و حليب الشوكلاتة",
//     'Day3LunchEn': "cheese burger and fries and chocolate milk shake",
//     'Day3DinnerEn': "salmon and rice and whole milk",
//     'Day3DinnerAr': "سالمون و ارز وحليب صافي",
//   },
//   {
//     'Day1BreakfastEn': "eggs and bacon and coffe",
//     'Day1BreakfastAr': "بيض ولحم مشوي و قهوه",
//     'Day1LunchAr': "فراخ و فاصوليا بيضاء وتفاح",
//     'Day1LunchEn': "chicken and white bean soup and apple",
//     'Day1DinnerEn': "cup of brown rice cocked and yogurt ",
//     'Day1DinnerAr': " ارز بني مطبوخ و زبادي",
//     'Day2BreakfastEn': " cereal and muesli and fresh fruits   ",
//     'Day2BreakfastAr': "رقائق الزرة و موسلي و فاكهه طازجة",
//     'Day2LunchAr': " دجاج كاري مطبوخ ببطئ و برتقاله متوسطة",
//     'Day2LunchEn': "slow cooker chicken curry and medium orange",
//     'Day2DinnerEn': "grilled salmon and halloumi cheese and yogurt",
//     'Day2DinnerAr': "سلمون مشوي وجبنة حلومي وزبادي",
//     'Day3BreakfastEn': "toast with cheese and fresh tomato and lettuce",
//     'Day3BreakfastAr': "خبز محمص بالجبنة و طماطم طازجة و خس",
//     'Day3LunchAr': "مكرونة التونة المخبوزة و جبنة البارميزان",
//     'Day3LunchEn': "baked tuna pasta and parmesan cheese",
//     'Day3DinnerEn': "white salad onion and rice cracker and yogurt",
//     'Day3DinnerAr': "سلطة بصل بيضاء و ارز متكسر و زبادي",
//   },
// ];


// InkWell my_home_items(BuildContext context) {
//   return InkWell(
//     borderRadius: BorderRadius.circular(10),
//     onTap: () {},
//     child: Stack(
//       children: [
//         SizedBox(
//           height: context.height * .22,
//           width: context.width * .85,
//           child: Card(
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             elevation: 4,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20),
//               ),
//             ),
//             child: Image.asset(
//               homeImage,
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 20,
//           left: 20,
//           right: 20,
//           child: Row(
//             children: [
//               Icon(
//                 Icons.maps_home_work_sharp,
//                 color: Colors.white,
//                 size: 30,
//               ),
//               SizedBox(
//                 width: context.width * .04,
//               ),
//               AutoSizeText(
//                 AppLocalizations.of(context)!.translate('tour')!,
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }

// AIzaSyAd4rEAQqf58fCJGABqW99teDP9BcuyN08
// AIzaSyDeMCv5KIBRscy7eXDwwNTPJgM5zoXGHvw
