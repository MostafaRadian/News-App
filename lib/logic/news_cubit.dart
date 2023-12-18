import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/Science%20/science_screen.dart';
import 'package:news_app/Screens/Sports/sports_screen.dart';
import 'package:news_app/Screens/business/business_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static int currentIndex = 0;
  static const List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen()
  ];
  static const List<String> titles = [
    "Business News",
    "Science News",
    "Sports News",
  ];

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
}
