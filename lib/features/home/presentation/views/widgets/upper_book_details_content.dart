import 'package:book_store/core/utils/styles.dart';
import 'package:book_store/core/widgets/books_action.dart';
import 'package:book_store/features/home/data/models/book_model/book_model.dart';
import 'package:book_store/features/home/presentation/views/widgets/book_rating.dart';
import 'package:book_store/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class UpperBookDetailsContent extends StatelessWidget {
  const UpperBookDetailsContent({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Padding(
            padding: const EdgeInsets.only(top: 33.2),
            child: CustomBookImage(
                imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''),
          ),
        ),
        const SizedBox(height: 45),
        Text(
          book.volumeInfo.title ?? 'Unknown',
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors?[0] ?? 'Unknown',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 0.0,
          reviewCount: book.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        const Row(
          children: [
            Expanded(
              child: BooksAction(
                text: 'Download',
                location: BooksActionLocation.left,
              ),
            ),
            Expanded(
              child: BooksAction(
                text: 'Free Preview',
                location: BooksActionLocation.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
