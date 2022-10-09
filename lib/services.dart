import 'package:get_it/get_it.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'data/datasources/address_datasource.dart';
import 'data/datasources/fake/fake_address_datasource.dart';
import 'data/datasources/local/local_address_datasource.dart';
import 'data/datasources/remote/remote_web3_datasource.dart';
import 'data/datasources/web3_datasource.dart';
import 'data/repositories/address_repository_impl.dart';
import 'data/repositories/web3_repository_impl.dart';
import 'data/services/web3_service.dart';
import 'domain/repositories/address_repository.dart';
import 'domain/repositories/web3_repository.dart';

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

  // Services
  locator.registerSingleton<Web3Service>(Web3Service());

  // Datasources
  locator.registerSingleton<Web3Datasource>(
    RemoteWeb3Datasource(locator<Web3Service>()),
  );

  locator.registerSingleton<AddressDatasource>(
    LocalAddressDatasource(rxSharedPreferences),
  );
}

void _registerRepositories() {
  // Repositories
  locator.registerSingleton<AddressRepository>(
    AddressRepositoryImpl(addressDatasource: locator()),
  );

  locator.registerSingleton<Web3Repository>(
    Web3RepositoryImpl(web3datasource: locator()),
  );
}
