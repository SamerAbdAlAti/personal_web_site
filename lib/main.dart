import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_web_site/core/maneger/cubit/app_cubit.dart';
import 'package:personal_web_site/res.dart';

import 'core/maneger/my_bloc_opserver.dart';
import 'core/share/style.dart';
import 'core/utils/routs.dart';
import 'featrues/home/presentation/pages/home_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  AppCubit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>AppCubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppStyle.lightTheme,
        darkTheme: AppStyle.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: Routs.homePage,
        routes: {Routs.homePage: (context) => const HomePage()},
      ),
    );
  }
}
