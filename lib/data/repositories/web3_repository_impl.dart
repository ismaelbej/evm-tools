import 'package:either_dart/either.dart';

import '../../domain/entities/account.dart';
import '../../domain/entities/failure.dart';
import '../../domain/repositories/web3_repository.dart';
import '../datasources/web3_datasource.dart';

class Web3RepositoryImpl implements Web3Repository {
  final Web3Datasource web3datasource;

  Web3RepositoryImpl({required this.web3datasource});

  @override
  Future<Either<Failure, Account>> resolveName(String name) async {
    final result = await web3datasource.resolveName(name);
    return result.either(
      (failure) => failure,
      (address) => Account(name: name, address: address),
    );
  }
}
