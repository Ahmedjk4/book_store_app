import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/core/widgets/custom_loading_effect.dart';
import 'package:book_store/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'custom_book_image.dart';

class FeaturedBooksCarousel extends StatelessWidget {
  const FeaturedBooksCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CarouselSlider(
              items: [
                for (var item in state.books)
                  GestureDetector(
                    onTap: () {
                      context.push(AppRouter.bookDetailsPath, extra: item);
                    },
                    child: CustomBookImage(
                      imageUrl: item.volumeInfo.imageLinks?.thumbnail ?? "",
                    ),
                  ),
              ],
              options: CarouselOptions(
                padEnds: false,
                height: MediaQuery.sizeOf(context).height * .3,
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.25,
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .15,
            child: const CustomLoadingEffect(axis: Axis.horizontal),
          );
        }
      },
    );
  }
}
