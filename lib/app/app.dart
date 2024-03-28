import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:posts_app_clean_architecture/app/navigation/app_router_config.dart';
import 'package:posts_app_clean_architecture/resources/theme/bloc/theme_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../injection_container.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 600, name: MOBILE),
        const Breakpoint(start: 601, end: 900, name: TABLET),
        const Breakpoint(start: 901, end: 1023, name: DESKTOP),
        const Breakpoint(start: 1024, end: double.infinity, name: '4K'),
      ],
      child: Builder(builder: (context) {
        return ScreenUtilInit(
            designSize:
                ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
                    ? const Size(360, 800)
                    : ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
                        ? const Size(900, 800)
                        : const Size(1440, 800),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => di.sl<LoginBloc>()),
                BlocProvider(
                    create: (_) =>
                        di.sl<ThemeBloc>()..add(GetCurrentThemeEvent())),
              ],
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, stateThem) {
                  if (stateThem is LoadedThemeState) {
                    return MaterialApp.router(
                      theme: stateThem.themeData,
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      debugShowCheckedModeBanner: false,
                      routerConfig: AppRouterConfig.router,
                    );
                  }
                  return Container();
                },
              ),
            ));
      }),
    );
    ;
  }
}
