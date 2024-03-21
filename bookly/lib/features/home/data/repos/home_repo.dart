// ignore_for_file: non_constant_identifier_names

import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> FetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> FetchFeaturedBooks();
}
