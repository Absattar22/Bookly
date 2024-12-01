import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementaion implements HomeRepo {
  final ApiService apiService;
  HomeRepoImplementaion(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeauteredBooks() {
    // TODO: implement fetchFeauteredBooks
    throw UnimplementedError();
  }
}
