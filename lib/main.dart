import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todosql/shared/Dloc/Bloc_Observed.dart';
import 'package:todosql/shared/theam/TheamMode.dart';

import 'home_layout/Home_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To_Do Sql",
      initialRoute: HomeLayout.id,
      routes: {
        HomeLayout.id: (c) => HomeLayout(),
      },
      theme: MyThemeData.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
