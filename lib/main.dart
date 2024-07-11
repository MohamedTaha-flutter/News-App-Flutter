import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/local/cache_helper.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/pages/HomePage.dart';

import 'bloc/cubit.dart';
import 'bloc/state.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init() ;
  bool? isDark = CacheHelper.getDAta(key: 'isDark');
  runApp( RunApp( isDark: isDark,));
}

class RunApp extends StatelessWidget {
  const RunApp({super.key, required this.isDark});
  final bool? isDark ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessData()..getSportData()..getScienceData()..changeThemeMode(shearedPer: isDark),
      child: BlocConsumer<NewsCubit, NewsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = NewsCubit.get(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Directionality(textDirection: TextDirection.ltr,
            child: HomePage()),
        theme: ThemeData(
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
            ),
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                type: BottomNavigationBarType.fixed,
                elevation: 0.0),
            appBarTheme: const AppBarTheme(
              elevation: 0.0,
              actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 25,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),

            )),
        darkTheme: ThemeData(
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 18,
              )
          ),
          scaffoldBackgroundColor: Colors.black54,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrange,
              backgroundColor: Colors.black54,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black54,

            elevation: 0.0,
            actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 25,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.black54,
                statusBarIconBrightness: Brightness.light),

          ),
        ),
        themeMode: cubit.isDark ?ThemeMode.light : ThemeMode.dark ,
      );
  },
),
    );
  }
}
