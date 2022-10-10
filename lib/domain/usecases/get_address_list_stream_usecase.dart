import '../entities/account.dart';
import '../repositories/address_repository.dart';

class GetAddressListStreamUsecase {
  final AddressRepository addressRepository;

  GetAddressListStreamUsecase({required this.addressRepository});

  Stream<List<Account>> call() => addressRepository.getAddressList();
}
