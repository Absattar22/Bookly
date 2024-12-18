import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {

  Future<Either<Failure, List<BookModel>>> searchBooks({required String title});
}