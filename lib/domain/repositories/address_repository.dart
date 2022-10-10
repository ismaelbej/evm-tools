import '../entities/account.dart';

abstract class AddressRepository {
  Stream<List<Account>> getAddressList();

  Future<bool> addAddress(Account address);

  Future<bool> removeAddress(Account address);
}
