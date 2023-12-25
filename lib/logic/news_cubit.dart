import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/Science%20/science_screen.dart';
import 'package:news_app/Screens/Sports/sports_screen.dart';
import 'package:news_app/Screens/business/business_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import '../network/local/cache_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static int currentIndex = 0;
  static bool mode = true;
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  static const String url =
      'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=3b22235fbfbf4f609ba0630c7619bae4';
  static const List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  static const List<String> titles = [
    "Business News",
    "Sports News",
    "Science News",
  ];
  static const List<BottomNavigationBarItem> navigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  Future<void> changeThemeMode({bool? sharedTheme}) async {
    if (sharedTheme != null) {
      mode = sharedTheme;
    } else {
      mode = !mode;
      await CacheHelper.putData(key: 'isDark', value: mode);
    }
    emit(ChangeThemeModeState());
  }

  Future<void> getBusiness() async {
    try {
      emit(NewsLoadingState());
      Response<dynamic> result = await DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '3b22235fbfbf4f609ba0630c7619bae4'
        },
      );
      business = result.data['articles'];
      emit(GetBusinessSuccessState());
    } catch (error) {
      if (kDebugMode) {
        print('An error occurred: $error');
      }
      emit(GetBusinessErrorState());
    }
  }

  Future<void> getSports() async {
    try {
      emit(NewsLoadingState());
      Response<dynamic> result = await DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '3b22235fbfbf4f609ba0630c7619bae4'
        },
      );
      sports = result.data['articles'];
      emit(GetSportsSuccessState());
    } catch (error) {
      if (kDebugMode) {
        print('An error occurred: $error');
      }
      emit(GetSportsErrorState());
    }
  }

  Future<void> getScience() async {
    try {
      emit(NewsLoadingState());
      Response<dynamic> result = await DioHelper.getData(
        url: '/v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '3b22235fbfbf4f609ba0630c7619bae4'
        },
      );
      science = result.data['articles'];
      emit(GetScienceSuccessState());
    } catch (error) {
      if (kDebugMode) {
        print('An error occurred: $error');
      }
      emit(GetScienceErrorState());
    }
  }

  Future<void> getAllNews() async {
    emit(NewsLoadingState());
    await getBusiness();
    await getScience();
    await getSports();
  }
}
