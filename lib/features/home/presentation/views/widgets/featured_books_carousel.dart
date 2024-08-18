import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/core/utils/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_book_image.dart';

class FeaturedBooksCarousel extends StatelessWidget {
  const FeaturedBooksCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: CarouselSlider(
        items: [
          GestureDetector(
            onTap: () {
              context.push(AppRouter.bookDetailsPath);
            },
            child: const CustomBookImage(
              image: AppAssets.testBookImage,
            ),
          ),
        ],
        options: CarouselOptions(
          padEnds: false,
          height: MediaQuery.sizeOf(context).height * .3,
          viewportFraction: 0.5,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          enlargeCenterPage: true,
          enlargeFactor: 0.25,
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
