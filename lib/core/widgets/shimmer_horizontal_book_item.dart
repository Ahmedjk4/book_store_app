import 'package:book_store/core/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHorizontalBookItem extends StatelessWidget {
  const ShimmerHorizontalBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withOpacity(0.7),
      highlightColor: Colors.white.withOpacity(0.5),
      child: const Column(
        children: [
          Skeleton(
            width: 64,
            height: 64,
          ),
          SizedBox(height: 10),
          Skeleton(
            width: 120,
            height: 10,
          ),
          SizedBox(height: 10),
          Skeleton(
            width: 100,
            height: 10,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
