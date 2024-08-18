import 'package:flutter/material.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_content.dart';
import 'upper_book_details_content.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomBookDetailsAppBar(),
            UpperBookDetailsContent(),
            SimilarBooksContent(),
          ],
        ),
      ),
    );
  }
}
