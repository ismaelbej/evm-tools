import '../models/account_model.dart';

abstract class AddressDatasource {
  Stream<List<AccountModel>> getAddressList();

  Future<void> addAddress(AccountModel account);

  Future<void> removeAddress(AccountModel account);
}
