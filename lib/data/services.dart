import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'datasources/address_datasource.dart';
import 'datasources/fake/fake_address_datasource.dart';
import 'datasources/fake/fake_web3_datasource.dart';
import 'datasources/local/local_address_datasource.dart';
import 'datasources/remote/remote_web3_datasource.dart';
import 'datasources/web3_datasource.dart';
import 'repositories/address_repository_impl.dart';
import 'repositories/web3_repository_impl.dart';
import 'services/web3_service.dart';
import '../domain/repositories/address_repository.dart';
import '../domain/repositories/web3_repository.dart';

GetIt locator = GetIt.instance;

Future<void> initializeFakeServices() async {
  await _registerFakeDatasources();

  _registerRepositories();
}

Future<void> initializeServices() async {
  await _registerDatasources();

  _registerRepositories();
}

Future _registerFakeDatasources() async {
  final accountsString = await _loadAsset("test_fixtures/sample-accounts.json");

  // Datasources
  locator.registerSingleton<AddressDatasource>(
    FakeAddressDatasource(accountsString),
  );

  locator.registerSingleton<Web3Datasource>(
    FakeWeb3Datasource(accountsString),
  );
}

Future _registerDatasources() async {
  final rxSharedPreferences = RxSharedPreferences.getInstance();

  // Services
  locator.registerSingleton<Web3Service>(Web3Service());

  // Datasources
  locator.registerSingleton<AddressDatasource>(
    LocalAddressDatasource(rxSharedPreferences),
  );

  locator.registerSingleton<Web3Datasource>(
    RemoteWeb3Datasource(locator<Web3Service>()),
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

Future<String> _loadAsset(asset) => rootBundle.loadString(asset);
