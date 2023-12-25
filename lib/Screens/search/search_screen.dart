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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: defaultFormField(
              searchController,
              TextInputType.text,
              (value) {
                if (value!.isEmpty) {
                  return 'Search must not be empty';
                } else {
                  return null;
                }
              },
              'Search',
              const Icon(Icons.search),
              (value) {
                if (_debounce != null) {
                  _debounce!.cancel();
                }

                _debounce = Timer(const Duration(milliseconds: 500), () {
                  currentSearchQuery =
                      value!; // Update the current search query
                  NewsCubit.get(context).getSearch(currentSearchQuery);
                  searchController.text = currentSearchQuery;
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                return articleBuilder(NewsCubit.get(context).search, context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
