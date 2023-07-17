part of 'newset_book_cubit.dart';

@immutable
abstract class NewsetBookState {}

class NewsetBookInitial extends NewsetBookState {}

class NewsetBookSuccess extends NewsetBookState {
  final List<BookEntity> books;

  NewsetBookSuccess(this.books);
}

class NewsetBookLoading extends NewsetBookState {}

class NewsetBookFailure extends NewsetBookState {
  final String errMessage;

  NewsetBookFailure(this.errMessage);
}
