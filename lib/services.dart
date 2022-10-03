import 'package:get_it/get_it.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'data/datasources/address_datasource.dart';
import 'data/datasources/local/local_address_datasource.dart';
import 'data/repositories/address_repository_impl.dart';
import 'domain/repositories/address_repository.dart';

GetIt locator = GetIt.instance;

Future<void> initializeServices() async {
  final rxSharedPreferences = RxSharedPreferences.getInstance();

  // Datasources
  locator.registerSingleton<AddressDatasource>(
    LocalAddressDatasource(rxSharedPreferences),
  );

  // Repositories
  locator.registerSingleton<AddressRepository>(
    AddressRepositoryImpl(addressDatasource: locator()),
  );
}
