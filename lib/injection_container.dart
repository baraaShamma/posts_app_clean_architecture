import 'package:go_router/go_router.dart';
import 'package:posts_app_clean_architecture/app/navigation/app_router_config.dart';
import 'package:posts_app_clean_architecture/features/auth/login/data/datasources/login_remote.dart';
import 'package:posts_app_clean_architecture/features/auth/login/data/repositories/login_repository_impl.dart';
import 'package:posts_app_clean_architecture/features/auth/login/domain/repositories/login_repository.dart';
import 'package:posts_app_clean_architecture/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:posts_app_clean_architecture/resources/network/network_info.dart';
import 'package:posts_app_clean_architecture/resources/theme/bloc/theme_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app_preferences.dart';

final sl = GetIt.instance;
resetAllModules() async {
  await sl.reset(dispose: false);
  await init();
}

Future<void> init() async {
//! Features - posts
  sl.registerLazySingleton<GoRouter>(() => AppRouterConfig.router);
  sl.registerFactory<AppPreferences>(
          () => AppPreferences(sl()));
// Bloc
  sl.registerLazySingleton(() => ThemeBloc());

  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));


// Usecases

  sl.registerLazySingleton(() => LoginUseCase(sl()));

// Repository

  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemote: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<LoginRemote>(
      () => LoginRemoteImpl(client: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
