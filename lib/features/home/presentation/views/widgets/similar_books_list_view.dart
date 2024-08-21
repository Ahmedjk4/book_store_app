import 'package:book_store/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: CustomBookImage(
                imageUrl:
                    'https://m.media-amazon.com/images/I/510+zRbr2qL._AC_UF894,1000_QL80_.jpg'),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
