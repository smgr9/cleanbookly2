import 'package:bookly/core/erorr/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param pragm]);
}

class NoParam {}
