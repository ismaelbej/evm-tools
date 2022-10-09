import 'package:either_dart/either.dart';

import '../../domain/entities/failure.dart';

abstract class Web3Datasource {
  Future<Either<Failure, String>> resolveName(String name);
}
