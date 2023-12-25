part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class ChangeNavBarState extends NewsState {}

class ChangeThemeModeState extends NewsState {}

class NewsLoadingState extends NewsState {}

class GetBusinessSuccessState extends NewsState {}

class GetBusinessErrorState extends NewsState {}

class GetSportsSuccessState extends NewsState {}

class GetSportsErrorState extends NewsState {}

class GetScienceSuccessState extends NewsState {}

class GetScienceErrorState extends NewsState {}

class GetSearchSuccessState extends NewsState {}

class GetSearchErrorState extends NewsState {}
