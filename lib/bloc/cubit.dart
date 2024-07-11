import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/state.dart';
import 'package:news/local/cache_helper.dart';
import 'package:news/pages/BusinessPage.dart';
import 'package:news/pages/SciencePage.dart';
import 'package:news/pages/SettingPage.dart';
import 'package:news/pages/SportsPage.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  List<BottomNavigationBarItem> items = const
  [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];
  List<Widget> pages = const
  [
    BusinessPage(),
    SportsPage(),
    SciencePage(),
  ];

  void changeNavBar(int Index)
  {
    currentIndex = Index ;
    emit(BottomNavBarChange());
  }
  List<dynamic> business = [] ;

  void getBusinessData()
  {
    emit(NewsBusinessDataLoadingState());
    DioHelper.getData(url: "v2/top-headlines",
      query:
      {
        'country':'us',
        'category':'business',
        'apiKey':'1d60a630e76f4d359bf11e1e43d6450d',
        // country=eg&category=business&apiKey=1d60a630e76f4d359bf11e1e43d6450d
      },
    ).then((value)
    {
      business = value.data['articles'] ;
      emit(NewsBusinessDataSuccessState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewsBusinessDataErrorState());
    });
  }
  List<dynamic> sport = [] ;

  void getSportData()
  {
    emit(NewsSportsDataLoadingState());
    DioHelper.getData(url: "v2/top-headlines",
      query:
      {
        'country':'us',
        'category':'sport',
        'apiKey':'1d60a630e76f4d359bf11e1e43d6450d',
        // country=eg&category=business&apiKey=1d60a630e76f4d359bf11e1e43d6450d
      },
    ).then((value)
    {
      sport = value.data['articles'] ;
      emit(NewsSportsDataSuccessState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewsSportsDataErrorState());
    });
  }
  List<dynamic> science = [] ;

  void getScienceData()
  {
    emit(NewsScienceDataLoadingState());
    DioHelper.getData(url: "v2/top-headlines",
      query:
      {
        'country':'us',
        'category':'science',
        'apiKey':'1d60a630e76f4d359bf11e1e43d6450d',
        // country=eg&category=business&apiKey=1d60a630e76f4d359bf11e1e43d6450d
      },
    ).then((value)
    {
      science = value.data['articles'] ;
      emit(NewsScienceDataSuccessState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewsScienceDataErrorState());
    });
  }

  bool isDark = false ;

  void changeThemeMode({bool? shearedPer})
  {
    if(shearedPer!=null)
    {
      isDark = shearedPer ;
      emit(ChangeThemeModeStat());

    }else {
      isDark = !isDark;
      CacheHelper.putDAta(key: "isDark", value: isDark).then((value)
      {
        emit(ChangeThemeModeStat());
      });
    }

  }

  List<dynamic> search = [] ;

  void getSearchData(String value)
  {
    search = [] ;
    emit(NewsSearchDataLoadingState());
    DioHelper.getData(url: "v2/everything",
      query:
      {
        'q': '$value',
        'apiKey': '1d60a630e76f4d359bf11e1e43d6450d',
      }).then((value)
    {
      search = value.data['articles'] ;
      emit(NewsSearchDataSuccessState());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(NewsSearchDataErrorState());
    });
  }
}
