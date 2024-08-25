import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/core/widgets/custom_error_widget.dart';
import 'package:book_store/core/widgets/custom_loading_effect.dart';
import 'package:book_store/core/widgets/custom_book_details_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../view_models/newest_books_cubit/newest_books_cubit.dart';

class NewestBooksSliverList extends StatelessWidget {
  const NewestBooksSliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push(AppRouter.bookDetailsPath,
                      extra: state.books[index]);
                },
                child: CustomBookDetailsListTile(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return const SliverFillRemaining(
            child: CustomLoadingEffect(
              axis: Axis.vertical,
            ),
          );
        }
      },
    );
  }
}
