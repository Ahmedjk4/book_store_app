import 'package:bloc/bloc.dart';
import 'package:book_store/features/home/data/models/book_model/book_model.dart';
import 'package:book_store/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_cubit_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;
  Future<void> searchBooks({required String query}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.searchBooks(query);
    result.fold(
      (failure) {
        emit(SearchBooksFailure(failure.errMessage));
      },
      (books) {
        emit(SearchBooksSuccess(books));
      },
    );
  }
}
