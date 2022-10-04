import 'package:rxdart/rxdart.dart';

import '../address_datasource.dart';
import 'fake_base_datasource.dart';

class FakeAddressDatasource
    with FakeBaseDatasource
    implements AddressDatasource {
  BehaviorSubject<List<String>> addresses;

  FakeAddressDatasource() : addresses = BehaviorSubject.seeded([]);

  @override
  Stream<List<String>> getAddressList() {
    return addresses.distinctUnique();
  }

  @override
  Future<void> addAddress(String address) async {
    await simulateDelay();
    if (!addresses.value.contains(address)) {
      addresses.add([...addresses.value, address]);
    }
  }

  @override
  Future<void> removeAddress(String address) async {
    await simulateDelay();
    final newAddresses =
        addresses.value.where((item) => item != address).toList();
    addresses.add(newAddresses);
  }
}
