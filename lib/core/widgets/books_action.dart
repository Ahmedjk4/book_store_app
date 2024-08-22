import 'package:book_store/core/utils/functions/custom_snack_bar.dart';
import 'package:book_store/core/utils/functions/launch_book_url.dart';
import 'package:book_store/core/utils/styles.dart';
import 'package:book_store/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.location,
    required this.text,
    required this.book,
  });
  final BooksActionLocation location;
  final String text;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: location == BooksActionLocation.right
            ? const Color(0xffEF8262)
            : Colors.white,
        borderRadius: location == BooksActionLocation.right
            ? const BorderRadius.only(
                topRight: Radius.circular(15), bottomRight: Radius.circular(15))
            : const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      child: Material(
        borderRadius: location == BooksActionLocation.right
            ? const BorderRadius.only(
                topRight: Radius.circular(15), bottomRight: Radius.circular(15))
            : const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: location == BooksActionLocation.right
              ? const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15))
              : const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
          onTap: () async {
            if (book.accessInfo!.pdf!.isAvailable! &&
                location == BooksActionLocation.right) {
              await launchBookUrl(context,
                  url: book.accessInfo!.pdf!.acsTokenLink!);
            } else if (book.accessInfo!.pdf!.isAvailable! == false &&
                location == BooksActionLocation.right) {
              customSnackBar(context, 'Book is not available');
            } else {
              launchBookUrl(context, url: book.volumeInfo.previewLink);
            }
          },
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: location == BooksActionLocation.right
                  ? const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))
                  : const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,
                    style: Styles.textStyle18.copyWith(
                        color: location == BooksActionLocation.right
                            ? Colors.white
                            : Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum BooksActionLocation {
  right,
  left,
}
