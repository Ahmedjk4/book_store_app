import 'package:book_store/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Exception, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Exception, List<BookModel>>> fetchNewestBooks();
}
