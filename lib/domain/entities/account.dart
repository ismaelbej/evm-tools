import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String name;
  final String address;

  const Account({
    required this.name,
    required this.address,
  });

  @override
  List<Object?> get props => [
        name,
        address,
      ];
}
