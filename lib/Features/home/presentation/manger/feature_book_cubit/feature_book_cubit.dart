import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/user_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'feature_book_state.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  FeatureBookCubit(this.featuredBooksUseCase) : super(FeatureBookInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeatureBooks() async {
    emit(FeatureBookLoading());
    var result = await featuredBooksUseCase.call();
    result.fold((failure) {
      emit(FeatureBookFailure(failure.errMessage));
    }, (books) {
      emit(FeatureBookSuccess(books));
    });
  }
}
