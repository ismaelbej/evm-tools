import '../entities/account.dart';
import '../repositories/address_repository.dart';

class AddAddressUsecase {
  final AddressRepository addressRepository;

  AddAddressUsecase({required this.addressRepository});

  Future<bool> call(Account account) async {
    return await addressRepository.addAddress(account);
  }
}
