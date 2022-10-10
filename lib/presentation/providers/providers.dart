import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/account.dart';
import '../navigation_bar.dart';
import 'address_list_state.dart';

GetIt locator = GetIt.instance;

final navigatorProvider =
    StateProvider<NavigatorEnum>((ref) => NavigatorEnum.values.first);

final addressListProvider = StateProvider<AddressListState>(
  (ref) => AddressListState(
    getAddressListStreamUsecase: locator(),
    addAddressUsecase: locator(),
    removeAddressUsecase: locator(),
    searchAddressUsecase: locator(),
  ),
);

final addressListStreamProvider = StreamProvider<List<Account>>((ref) {
  final addressListState = ref.watch(addressListProvider);
  return addressListState.getAddressList();
});
