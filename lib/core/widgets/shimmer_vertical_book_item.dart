import 'package:book_store/core/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerVerticalBookItem extends StatelessWidget {
  const ShimmerVerticalBookItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withOpacity(0.7),
      highlightColor: Colors.white.withOpacity(0.5),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(height: 64, width: 64),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Skeleton(
                width: 120,
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                SizedBox(
                  width: 10,
                ),
                Skeleton(
                  width: 80,
                  height: 10,
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Skeleton(
                width: 40,
                height: 10,
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Skeleton(height: 10, width: 64),
            ],
          ),
        ],
      ),
    );
  }
}
