import '../../domain/entities/account.dart';
import '../../domain/repositories/address_repository.dart';
import '../datasources/address_datasource.dart';
import '../models/account_model.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressDatasource addressDatasource;

  AddressRepositoryImpl({
    required this.addressDatasource,
  });

  @override
  Stream<List<Account>> getAddressList() =>
      addressDatasource.getAddressList().map((accounts) =>
          accounts.map((account) => account.toAccount()).toList());

  @override
  Future<void> addAddress(Account account) =>
      addressDatasource.addAddress(AccountModel.fromAccount(account));

  @override
  Future<void> removeAddress(Account account) =>
      addressDatasource.removeAddress(AccountModel.fromAccount(account));
}
