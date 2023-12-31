import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/logic/news_cubit.dart';

import '../Screens/web_view/web_view.dart';

Widget buildArticleItem(Map<String, dynamic> article, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(
                      url: article['url'],
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: article['urlToImage'] != null &&
                          article['urlToImage'].isNotEmpty
                      ? NetworkImage('${article['urlToImage']}')
                      : const AssetImage(
                              '/Users/mostafaahmed/Documents/Flutter projects/news_app/Assets/Placeholder_view_vector.svg.png')
                          as ImageProvider<Object>,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: BlocBuilder<NewsCubit, NewsState>(
                        builder: (context, state) {
                          return Text(
                            '${article['title']}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        },
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget articleBuilder(newsList, context) => ConditionalBuilder(
      condition: newsList.length > 0,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            buildArticleItem(newsList[index], context),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
        itemCount: newsList.length,
      ),
      fallback: (context) => const Center(
          child: CircularProgressIndicator(
        color: Color(0xff7D5260),
      )),
    );

Widget defaultFormField(
  TextEditingController controller,
  TextInputType type,
  String? Function(String? value) validate,
  String label,
  Icon prefixIcon,
  void Function(String?) onChange, {
  bool hidden = false,
  IconData? suffixIcon,
}) =>
    SizedBox(
      width: 300,
      child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: hidden,
          onFieldSubmitted: onChange,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            prefixIcon: prefixIcon,
            suffixIcon: IconButton(
                onPressed: () {}, icon: Icon(suffixIcon ?? suffixIcon)),
          ),
          validator: validate),
    );
