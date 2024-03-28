import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'injection_container.dart' as di;
import 'resources/localization/language_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  Bloc.observer = MyBlocObserver();

  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/lang',
      child: const MyApp(),
    ),
  );
}
