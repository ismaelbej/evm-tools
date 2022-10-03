import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import '../address_datasource.dart';

class LocalAddressDatasource implements AddressDatasource {
  final RxSharedPreferences rxSharedPreferences;

  static const keyAddressList = "addressList";

  LocalAddressDatasource(this.rxSharedPreferences);

  @override
  Stream<List<String>> getAddressList() => rxSharedPreferences
      .getStringListStream(keyAddressList)
      .map((addressList) => addressList ?? <String>[]);

  @override
  Future<void> addAddress(String address) async {
    final addressList =
        await rxSharedPreferences.getStringList(keyAddressList) ?? [];

    final newAddressList =
        addressList.contains(address) ? addressList : [...addressList, address];

    rxSharedPreferences.setStringList(keyAddressList, newAddressList);
  }

  @override
  Future<void> removeAddress(String oldAddress) async {
    final addressList =
        await rxSharedPreferences.getStringList(keyAddressList) ?? [];

    final newAddressList =
        addressList.where((address) => address != oldAddress).toList();

    rxSharedPreferences.setStringList(keyAddressList, newAddressList);
  }
}
