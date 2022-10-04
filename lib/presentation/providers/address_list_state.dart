import '../../domain/repositories/address_repository.dart';

class AddressListState {
  final AddressRepository addressRepository;

  AddressListState({required this.addressRepository});

  Stream<List<String>> getAddressList() => addressRepository.getAddressList();

  Future<void> addAddress(String address) =>
      addressRepository.addAddress(address);

  Future<void> removeAddress(String address) =>
      addressRepository.removeAddress(address);
}
