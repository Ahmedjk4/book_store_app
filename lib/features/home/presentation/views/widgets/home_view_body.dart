import 'package:book_store/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'newest_books_sliver_list.dart';
import 'custom_app_bar.dart';
import 'featured_books_carousel.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(),
              FeaturedBooksCarousel(),
              SizedBox(height: 49),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Newest Books',
                    style: Styles.textStyle18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        NewestBooksSliverList(),
      ],
    );
  }
}
