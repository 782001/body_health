abstract class HomeStates {}

class InitialState extends HomeStates {}

class UploadCaloriesLoadingState extends HomeStates {}

class UploadCaloriesSuccessState extends HomeStates {}
// class UploadCaloriesErrorState extends HomeStates {}

class UploadCaloriesErrorState extends HomeStates {
  UploadCaloriesErrorState(
    String string,
  );
}

class ChangeDialogState extends HomeStates {}

class GetCaloriesLoadingState extends HomeStates {}

class GetCaloriesSucssesState extends HomeStates {}

class GetCaloriesErrorState extends HomeStates {
  final String error;

  GetCaloriesErrorState(this.error);
}
class GetExercisesLoadingState extends HomeStates {}

class GetExercisesSucssesState extends HomeStates {}

class GetExercisesErrorState extends HomeStates {
  final String error;

  GetExercisesErrorState(this.error);
}

class GetBodyVitaLoadingState extends HomeStates {}

class GetBodyVitaSucssesState extends HomeStates {}

class GetBodyVitaErrorState extends HomeStates {
  final String error;

  GetBodyVitaErrorState(this.error);
}

class GetBodyEnergyLoadingState extends HomeStates {}

class GetBodyEnergySucssesState extends HomeStates {}

class GetBodyEnergyErrorState extends HomeStates {
  final String error;

  GetBodyEnergyErrorState(this.error);
}

class GetunderWeightLoadingState extends HomeStates {}

class GetunderWeightSucssesState extends HomeStates {}

class GetunderWeightErrorState extends HomeStates {
  final String error;

  GetunderWeightErrorState(this.error);
}
