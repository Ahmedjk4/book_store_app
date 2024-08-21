import 'package:book_store/core/utils/styles.dart';
import 'package:book_store/core/widgets/books_action.dart';
import 'package:book_store/features/home/presentation/views/widgets/book_rating.dart';
import 'package:book_store/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class UpperBookDetailsContent extends StatelessWidget {
  const UpperBookDetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: const Padding(
            padding: EdgeInsets.only(top: 33.2),
            child: CustomBookImage(
                imageUrl:
                    'https://m.media-amazon.com/images/I/510+zRbr2qL._AC_UF894,1000_QL80_.jpg'),
          ),
        ),
        const SizedBox(height: 45),
        const Text(
          "The Jungle Book",
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16),
        const BookRating(
          rating: 4,
          reviewCount: 129,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        const Row(
          children: [
            Expanded(
              child: BooksAction(
                text: '19.99 \$',
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
