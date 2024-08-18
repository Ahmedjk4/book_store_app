import 'package:book_store/core/utils/assets.dart';
import 'package:book_store/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: const Padding(
              padding: EdgeInsets.only(top: 33.2),
              child: CustomBookImage(image: AppAssets.testBookImage),
            ),
          ),
        ],
      ),
    );
  }
}
