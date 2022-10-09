import 'package:collection/collection.dart';
import 'package:either_dart/either.dart';

import '../../../domain/entities/failure.dart';
import '../../models/account_model.dart';
import '../../utils/account_utils.dart';
import '../web3_datasource.dart';
import 'fake_base_datasource.dart';

class FakeWeb3Datasource with FakeBaseDatasource implements Web3Datasource {
  late final List<AccountModel> _accounts;

  FakeWeb3Datasource(String accountsString)
      : _accounts = parseAccountsString(accountsString);

  @override
  Future<Either<Failure, String>> resolveName(String name) async {
    await simulateDelay();

    final result =
        _accounts.firstWhereOrNull((account) => account.name == name);

    return Either.condLazy<Failure, String>(
      result != null,
      () => Failure(),
      () => result!.address,
    );
  }
}
