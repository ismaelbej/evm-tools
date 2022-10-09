import 'package:rxdart/rxdart.dart';

import '../../models/account_model.dart';
import '../address_datasource.dart';
import 'fake_base_datasource.dart';

class FakeAddressDatasource
    with FakeBaseDatasource
    implements AddressDatasource {
  BehaviorSubject<List<AccountModel>> addresses;

  FakeAddressDatasource() : addresses = BehaviorSubject.seeded([]);

  @override
  Stream<List<AccountModel>> getAddressList() {
    return addresses.distinctUnique();
  }

  @override
  Future<void> addAddress(AccountModel account) async {
    await simulateDelay();

    if (!addresses.value.contains(account)) {
      addresses.add([...addresses.value, account]);
    }
  }

  @override
  Future<void> removeAddress(AccountModel account) async {
    await simulateDelay();

    final newAddresses =
        addresses.value.where((item) => item != account).toList();

    addresses.add(newAddresses);
  }
}
