import 'package:either_dart/either.dart';

import '../entities/account.dart';
import '../entities/failure.dart';

abstract class Web3Repository {
  Future<Either<Failure, Account>> resolveName(String name);
}
