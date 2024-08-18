import 'package:book_store/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.location,
    required this.text,
  });
  final BooksActionLocation location;
  final String text;
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
          onTap: () {},
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
