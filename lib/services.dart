import 'package:get_it/get_it.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'data/datasources/address_datasource.dart';
import 'data/datasources/fake/fake_address_datasource.dart';
import 'data/datasources/local/local_address_datasource.dart';
import 'data/repositories/address_repository_impl.dart';
import 'domain/repositories/address_repository.dart';

GetIt locator = GetIt.instance;

Future<void> initializeFakeServices() async {
  _registerFakeDatasources();

  _registerRepositories();
}

Future<void> initializeServices() async {
  _registerDatasources();

  _registerRepositories();
}

void _registerFakeDatasources() {
  // Datasources
  locator.registerSingleton<AddressDatasource>(
    FakeAddressDatasource(),
  );
}

void _registerDatasources() {
  final rxSharedPreferences = RxSharedPreferences.getInstance();

  // Datasources
  locator.registerSingleton<AddressDatasource>(
    LocalAddressDatasource(rxSharedPreferences),
  );
}

void _registerRepositories() {
  // Repositories
  locator.registerSingleton<AddressRepository>(
    AddressRepositoryImpl(addressDatasource: locator()),
  );
}
