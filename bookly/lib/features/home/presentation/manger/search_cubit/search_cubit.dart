import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo, this.bookName) : super(SearchInitial());
  final HomeRepo homeRepo;
  String bookName;
  Future<void> SearchBooks() async {
    emit(SearchLoading());
    var result = await homeRepo.FetchBestSellerBooks();
    result.fold((failure) {
      emit(SearchFailure());
    }, (books) {
      for (var book in books) {
        if (book.volumeInfo.title == bookName) {
          emit(SearchSuccess(books));
        }
      }
    });
  }
}
