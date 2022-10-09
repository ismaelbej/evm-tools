import 'package:either_dart/either.dart';

import '../../../domain/entities/failure.dart';
import '../../services/web3_service.dart';
import '../web3_datasource.dart';

class RemoteWeb3Datasource implements Web3Datasource {
  final Web3Service web3service;

  RemoteWeb3Datasource(this.web3service);

  @override
  Future<Either<Failure, String>> resolveName(String name) async {
    try {
      final address = await web3service.resolveName(name);
      return Right(address);
    } catch (ex) {
      return Left(Failure());
    }
  }
}
