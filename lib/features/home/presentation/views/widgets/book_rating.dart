import 'package:book_store/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment,
    required this.rating,
    required this.reviewCount,
  });
  final num rating;
  final num reviewCount;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: HexColor('#FFDD4F'),
        ),
        const SizedBox(width: 6.3),
        Text('$rating', style: Styles.textStyle16),
        const SizedBox(width: 5),
        Opacity(
          opacity: .5,
          child: Text('($reviewCount)', style: Styles.textStyle14),
        ),
      ],
    );
  }
}
