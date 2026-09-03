import 'package:either_dart/either.dart';
import 'package:tally_mobile/common/domain/failure.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
typedef StreamFailureOr<T> = Stream<Either<Failure, T>>;
