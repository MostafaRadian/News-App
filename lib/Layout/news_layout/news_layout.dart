import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/search/search_screen.dart';

import '../../logic/news_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // AppBar with theme primary color
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        title: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return Text(
              NewsCubit.titles[NewsCubit.currentIndex],
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            icon: const Icon(Icons.search, color: Colors.white),
            tooltip: 'Search',
          ),
          IconButton(
            onPressed: () {
              NewsCubit.get(context).changeThemeMode();
            },
            icon: const Icon(Icons.brightness_4_outlined, color: Colors.white),
            tooltip: 'Toggle Theme',
          ),
        ],
      ),

      // Body with card-like container
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: NewsCubit.screens[NewsCubit.currentIndex],
          );
        },
      ),

      // BottomNavigationBar with selected indicator
      bottomNavigationBar: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: NewsCubit.currentIndex,
              onTap: (index) => NewsCubit.get(context).changeNavBar(index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
              selectedItemColor: theme.colorScheme.primary,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              items: NewsCubit.navigationItems.map((item) {
                final isSelected = NewsCubit.navigationItems.indexOf(item) ==
                    NewsCubit.currentIndex;
                return BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? theme.colorScheme.primary.withOpacity(0.2)
                          : Colors.transparent,
                    ),
                    child: item.icon,
                  ),
                  label: item.label,
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
