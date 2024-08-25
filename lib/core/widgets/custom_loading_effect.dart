import 'package:book_store/core/widgets/shimmer_horizontal_book_item.dart';
import 'package:flutter/material.dart';
import 'shimmer_vertical_book_item.dart';

class CustomLoadingEffect extends StatelessWidget {
  const CustomLoadingEffect({
    super.key,
    required this.axis,
  });
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: axis,
      itemBuilder: (context, index) => axis == Axis.horizontal
          ? const ShimmerHorizontalBookItem()
          : const ShimmerVerticalBookItem(),
      separatorBuilder: (context, index) => axis == Axis.horizontal
          ? const SizedBox(
              width: 10,
            )
          : const SizedBox(
              height: 10,
            ),
      itemCount: 10,
    );
  }
}
