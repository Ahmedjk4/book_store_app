// import 'package:book_store/features/home/presentation/views/widgets/custom_book_details_list_tile.dart';
import 'package:book_store/core/widgets/custom_loading_effect.dart';
import 'package:book_store/core/widgets/custom_book_details_list_tile.dart';
import 'package:book_store/features/search/presentation/view_models/search_books_cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomBookDetailsListTile(
                  book: state.books[index],
                ),
              );
            },
            itemCount: state.books.length,
          );
        } else if (state is SearchBooksFailure) {
          return Text(state.errMessage);
        } else if (state is SearchBooksLoading) {
          return const CustomLoadingEffect(
            axis: Axis.vertical,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
