import 'dart:convert';

import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/account_model.dart';
import '../address_datasource.dart';

class LocalAddressDatasource implements AddressDatasource {
  final RxSharedPreferences rxSharedPreferences;

  static const keyAddressList = "addressList";

  LocalAddressDatasource(this.rxSharedPreferences);

  @override
  Stream<List<AccountModel>> getAddressList() => rxSharedPreferences
      .getStringListStream(keyAddressList)
      .map((addressList) => _toAccountList(addressList ?? <String>[]))
      .distinctUnique();

  @override
  Future<void> addAddress(AccountModel account) async {
    final accounts = _toAccountList(
        await rxSharedPreferences.getStringList(keyAddressList) ?? <String>[]);

    final newAccounts =
        accounts.contains(account) ? accounts : [...accounts, account];

    rxSharedPreferences.setStringList(
        keyAddressList, _toStringList(newAccounts));
  }

  @override
  Future<void> removeAddress(AccountModel account) async {
    final addressList = _toAccountList(
        await rxSharedPreferences.getStringList(keyAddressList) ?? <String>[]);

    final newAddressList =
        addressList.where((address) => address != account).toList();

    rxSharedPreferences.setStringList(
        keyAddressList, _toStringList(newAddressList));
  }

  List<String> _toStringList(List<AccountModel> accounts) =>
      accounts.map((account) => jsonEncode(account.toJson())).toList();

  List<AccountModel> _toAccountList(List<String> accounts) => accounts
      .map((account) => AccountModel.fromJson(jsonDecode(account)))
      .toList();
}
