import 'package:either_dart/either.dart';

import '../entities/account.dart';
import '../entities/failure.dart';
import '../repositories/web3_repository.dart';

class SearchNameUsecase {
  final Web3Repository web3repository;
  SearchNameUsecase({required this.web3repository});

  Future<Either<Failure, Account>> call(String name) async {
    return web3repository.resolveName(name);
  }
}
