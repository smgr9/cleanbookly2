import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/save_books.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDatasourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDatasourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    String endPoint = "volumes?Filtering=free-ebooks&q=Subject:Programming";
    var data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    String endPoint =
        "volumes?Filtering=free-ebooks&Sorting=newest&q=Subject:Programming";
    var data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewsetBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items "]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
