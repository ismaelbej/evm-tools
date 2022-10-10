import '../models/account_model.dart';

abstract class AddressDatasource {
  Stream<List<AccountModel>> getAddressList();

  Future<bool> addAddress(AccountModel account);

  Future<bool> removeAddress(AccountModel account);
}
