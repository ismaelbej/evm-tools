import '../../domain/entities/account.dart';
import '../../domain/repositories/address_repository.dart';

class AddressListState {
  final AddressRepository addressRepository;

  AddressListState({required this.addressRepository});

  Stream<List<Account>> getAddressList() => addressRepository.getAddressList();

  Future<void> addAddress(Account account) =>
      addressRepository.addAddress(account);

  Future<void> removeAddress(Account account) =>
      addressRepository.removeAddress(account);
}
