import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:body_health/app/localization/data/datasources/lang_local_data_source.dart';
import 'package:body_health/app/localization/data/repositories/lang_repository_impl.dart';
import 'package:body_health/app/localization/domain/repositories/lang_repository.dart';
import 'package:body_health/app/localization/domain/usecases/change_lang.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:body_health/app/localization/presentation/cubit/locale_cubit.dart';
import 'package:body_health/app/localization/domain/usecases/get_saved_lang.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs

  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));
  // sl.registerFactory<CharactersCubit>(() => CharactersCubit(
  //       getcharactersUseCase: sl(),
  //     ));
  // sl.registerFactory<PlacesCubit>(() => PlacesCubit(
  //       getplacesUseCase: sl(),
  //     ));

  // Use cases

  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepository: sl()));
  // sl.registerLazySingleton<GetCharactersUseCase>(
  //     () => GetCharactersUseCase(charactersBaseRepository: sl()));
  // sl.registerLazySingleton<GetPlacesUseCase>(
  //     () => GetPlacesUseCase(placesBaseRepository: sl()));

  // Repository
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));
  // sl.registerLazySingleton<CharactersBaseRepository>(
  //     () => CharactersRepository(sl()));
  // sl.registerLazySingleton<PlacesBaseRepository>(() => PlacesRepository(sl()));

  // Data Sources

  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImpl(sharedPreferences: sl()));

  // sl.registerLazySingleton<GetCharactersBaseRemoteDataSource>(
  //     () => GetCharactersRemoteDataSource());
  // sl.registerLazySingleton<GetPlacesBaseRemoteDataSource>(
  //     () => GetPlacesRemoteDataSource());

  //! Core

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
