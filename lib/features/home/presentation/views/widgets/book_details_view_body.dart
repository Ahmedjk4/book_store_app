import 'package:book_store/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_content.dart';
import 'upper_book_details_content.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBookDetailsAppBar(),
            UpperBookDetailsContent(
              book: book,
            ),
            const SimilarBooksContent(),
          ],
        ),
      ),
    );
  }
}
