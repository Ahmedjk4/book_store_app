import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 30,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(AppRouter.bookDetailsPath, extra: index);
          },
          child: const BestSellerItem(),
        );
      },
    );
  }
}
