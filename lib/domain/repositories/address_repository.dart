import '../entities/account.dart';

abstract class AddressRepository {
  Stream<List<Account>> getAddressList();

  Future<void> addAddress(Account address);

  Future<void> removeAddress(Account address);
}
