import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/search/search_screen.dart';

import '../../logic/news_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return Text(NewsCubit.titles[NewsCubit.currentIndex]);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              NewsCubit.get(context).changeThemeMode();
            },
            icon: const Icon(Icons.brightness_4_outlined),
          )
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return NewsCubit.screens[NewsCubit.currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: NewsCubit.currentIndex,
            onTap: (index) => NewsCubit.get(context).changeNavBar(index),
            items: NewsCubit.navigationItems,
          );
        },
      ),
    );
  }
}
