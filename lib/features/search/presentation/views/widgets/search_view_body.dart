import 'package:book_store/core/utils/styles.dart';
import 'package:book_store/features/search/presentation/view_models/search_books_cubit/search_cubit_cubit.dart';
import 'package:book_store/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onPressed: (value) {
              BlocProvider.of<SearchBooksCubit>(context).searchBooks(
                query: value,
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
