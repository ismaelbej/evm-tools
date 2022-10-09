import 'package:equatable/equatable.dart';

import '../../domain/entities/account.dart';

class AccountModel extends Equatable {
  final String name;
  final String address;

  const AccountModel({
    required this.name,
    required this.address,
  });

  factory AccountModel.fromJson(Map item) => AccountModel(
        name: item['name'],
        address: item['address'],
      );

  Map toJson() => Map.fromEntries([
        MapEntry('name', name),
        MapEntry('address', address),
      ]);

  factory AccountModel.fromAccount(Account account) => AccountModel(
        name: account.name,
        address: account.address,
      );

  Account toAccount() => Account(
        name: name,
        address: address,
      );

  @override
  List<Object> get props => [
        name,
        address,
      ];
}
