import 'package:book_store/core/errors/failures.dart';
import 'package:book_store/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchBooks(String query);
}
