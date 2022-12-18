import 'package:apitesting/cubit/cubit.dart';
import 'package:apitesting/repository.dart';
import 'package:apitesting/web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<Repository>(() => Repository(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
}
