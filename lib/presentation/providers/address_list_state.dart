import 'package:either_dart/either.dart';

import '../../domain/entities/account.dart';
import '../../domain/entities/failure.dart';
import '../../domain/usecases/add_address_usecase.dart';
import '../../domain/usecases/get_address_list_stream_usecase.dart';
import '../../domain/usecases/remove_address_usecase.dart';
import '../../domain/usecases/search_address_usecase.dart';

class AddressListState {
  final GetAddressListStreamUsecase getAddressListStreamUsecase;
  final AddAddressUsecase addAddressUsecase;
  final RemoveAddressUsecase removeAddressUsecase;
  final SearchAddressUsecase searchAddressUsecase;

  AddressListState({
    required this.getAddressListStreamUsecase,
    required this.addAddressUsecase,
    required this.removeAddressUsecase,
    required this.searchAddressUsecase,
  });

  Stream<List<Account>> getAddressList() => getAddressListStreamUsecase();

  Future<bool> addAddress(Account account) => addAddressUsecase(account);

  Future<bool> removeAddress(Account account) => removeAddressUsecase(account);

  Future<Either<Failure, Account>> searchAddress(String address) =>
      searchAddressUsecase(address);
}
