// import 'package:book_store/features/home/presentation/views/widgets/custom_book_details_list_tile.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          // child: CustomBookDetailsListTile(),
        );
      },
      itemCount: 10,
    );
  }
}
