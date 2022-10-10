import 'package:rxdart/rxdart.dart';

import '../../models/account_model.dart';
import '../../utils/account_utils.dart';
import '../address_datasource.dart';
import 'fake_base_datasource.dart';

class FakeAddressDatasource
    with FakeBaseDatasource
    implements AddressDatasource {
  late final BehaviorSubject<List<AccountModel>> _accounts;

  FakeAddressDatasource(String accountString)
      : _accounts = BehaviorSubject.seeded(parseAccountsString(accountString));

  @override
  Stream<List<AccountModel>> getAddressList() {
    return _accounts.distinctUnique();
  }

  @override
  Future<bool> addAddress(AccountModel account) async {
    await simulateDelay();

    if (!_accounts.value.contains(account)) {
      _accounts.add([..._accounts.value, account]);
    }

    return true;
  }

  @override
  Future<bool> removeAddress(AccountModel account) async {
    await simulateDelay();

    final newAccounts =
        _accounts.value.where((item) => item != account).toList();

    _accounts.add(newAccounts);

    return true;
  }
}
