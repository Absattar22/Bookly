import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/search/presentation/views/widgets/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  SearchRepoImplementation({required this.apiService});
  final ApiService apiService;
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String title}) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=$title',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        if (title.toLowerCase().startsWith(
              title.toLowerCase(),
            )) {
          books.add(
            BookModel.fromJson(item),
          );
        }
      }

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
