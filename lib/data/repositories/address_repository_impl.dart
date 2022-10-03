import '../../domain/repositories/address_repository.dart';
import '../datasources/address_datasource.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressDatasource addressDatasource;

  AddressRepositoryImpl({
    required this.addressDatasource,
  });

  @override
  Stream<List<String>> getAddressList() => addressDatasource.getAddressList();

  @override
  Future<void> addAddress(String address) =>
      addressDatasource.addAddress(address);

  @override
  Future<void> removeAddress(String address) =>
      addressDatasource.removeAddress(address);
}
