import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Components/components.dart';
import '../../logic/news_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  String currentSearchQuery = ''; // Store the current search query

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: theme.appBarTheme.titleTextStyle,
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: theme.appBarTheme.elevation,
        iconTheme: theme.iconTheme,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: theme.brightness == Brightness.light
                        ? Colors.grey.withOpacity(0.3)
                        : Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: defaultFormField(
                searchController,
                TextInputType.text,
                    (value) {
                  if (value!.isEmpty) return 'Search must not be empty';
                  return null;
                },
                'Search',
                Icon(Icons.search, color: theme.iconTheme.color),
                    (value) {
                  if (_debounce != null) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    currentSearchQuery = value!; // Original logic untouched
                    NewsCubit.get(context).getSearch(currentSearchQuery);
                    searchController.text = currentSearchQuery;
                  });
                },
              ),
            ),
          ),

          // Articles List (exactly your original logic)
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                return articleBuilder(
                  NewsCubit.get(context).search,
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
