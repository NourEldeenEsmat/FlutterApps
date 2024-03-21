// ignore_for_file: non_constant_identifier_names

import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiservice;
  HomeRepoImp(this.apiservice);

  @override
  Future<Either<Failure, List<BookModel>>> FetchBestSellerBooks() async {
    // TODO: implement FetchBestSellerBooks
    try {
      var data = await apiservice.get(
          endpoint:
              'volumes?q=Subject:Programing&filtering=free-ebooks&Sorting=newest');

      List<BookModel> books = [];
      for (var i in data['items']) {
        books.add(BookModel.fromJson(i));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromResponse(e as int, e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> FetchFeaturedBooks() async {
    try {
      var data = await apiservice.get(
          endpoint: 'volumes?q=Subject:Programing&filtering=free-ebooks');

      List<BookModel> books = [];
      for (var i in data['items']) {
        books.add(BookModel.fromJson(i));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromResponse(e as int, e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
