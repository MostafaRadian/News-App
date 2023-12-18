import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/news_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return Text(NewsCubit.titles[NewsCubit.currentIndex]);
          },
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return NewsCubit.screens[NewsCubit.currentIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: NewsCubit.currentIndex,
            onTap: (index) => NewsCubit.get(context).changeNavBar(index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: "News"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: "News"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: "News")
            ],
          );
        },
      ),
    );
  }
}
