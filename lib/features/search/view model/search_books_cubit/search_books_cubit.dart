import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;

  Future<void> searchBooks({required String title}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.searchBooks(title: title);

    result.fold(
      (failure) {
        emit(SearchBooksFailure(errMessage:  failure.errMessage));
      },
      (books) {
        emit(SearchBooksSuccess(books: books));
      },
    );
  }
}
