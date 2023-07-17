part of 'feature_book_cubit.dart';

@immutable
abstract class FeatureBookState {}

class FeatureBookInitial extends FeatureBookState {}

class FeatureBookSuccess extends FeatureBookState {
  final List<BookEntity> books;

  FeatureBookSuccess(this.books);
}

class FeatureBookFailure extends FeatureBookState {
  final String errMessage;

  FeatureBookFailure(this.errMessage);
}

class FeatureBookLoading extends FeatureBookState {}
