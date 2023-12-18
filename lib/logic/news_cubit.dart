import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/Science%20/science_screen.dart';
import 'package:news_app/Screens/Settings/settings_screen.dart';
import 'package:news_app/Screens/Sports/sports_screen.dart';
import 'package:news_app/Screens/business/business_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static int currentIndex = 0;
  static const List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  static const List<String> titles = [
    "Business News",
    "Sports News",
    "Science News",
    "Settings"
  ];
  static const List<BottomNavigationBarItem> navigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
}
