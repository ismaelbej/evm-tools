import '../../domain/entities/account.dart';
import '../../domain/usecases/add_address_usecase.dart';
import '../../domain/usecases/get_address_list_stream_usecase.dart';
import '../../domain/usecases/remove_address_usecase.dart';

class AddressListState {
  final GetAddressListStreamUsecase getAddressListStreamUsecase;
  final AddAddressUsecase addAddressUsecase;
  final RemoveAddressUsecase removeAddressUsecase;

  AddressListState({
    required this.getAddressListStreamUsecase,
    required this.addAddressUsecase,
    required this.removeAddressUsecase,
  });

  Stream<List<Account>> getAddressList() => getAddressListStreamUsecase();

  Future<bool> addAddress(Account account) => addAddressUsecase(account);

  Future<bool> removeAddress(Account account) => removeAddressUsecase(account);
}
