import '../entities/account.dart';
import '../repositories/address_repository.dart';

class RemoveAddressUsecase {
  final AddressRepository addressRepository;

  RemoveAddressUsecase({required this.addressRepository});

  Future<bool> call(Account account) async {
    return await addressRepository.removeAddress(account);
  }
}
