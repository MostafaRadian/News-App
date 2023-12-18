import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static int currentIndex = 0;
  static const List<Widget> screens = [];
  static const List<String> titles = [
    "Main News",
    "Sports News",
    "Fashion news"
  ];

  static NewsCubit get(context) => BlocProvider.of(context);

  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
}
