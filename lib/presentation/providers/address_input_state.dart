import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/utils/address_utils.dart';
import '../../domain/entities/account.dart';
import '../../domain/entities/failure.dart';
import '../../domain/usecases/search_address_usecase.dart';

class AddressInputNotifier extends StateNotifier<AddressInputState> {
  final SearchNameUsecase searchNameUsecase;

  AddressInputNotifier({required this.searchNameUsecase})
      : super(InitialInput());

  Future<void> searchName(String name) async {
    state = SearchingName();

    final result = await _searchName(name);

    state = result.fold(
      (failure) => SearchError(failure: failure),
      (account) => ValidAccount(account: account),
    );
  }

  Future<Either<Failure, Account>> _searchName(String name) async {
    if (isAddress(name)) {
      return Right(Account(address: name, name: ""));
    }
    if (!name.toLowerCase().endsWith(".eth")) {
      name = "$name.eth";
    }

    final result = await searchNameUsecase(name);

    if (result.isRight && result.right.address == zeroAddress) {
      return Left(Failure());
    }
    return result;
  }
}

abstract class AddressInputState extends Equatable {
  const AddressInputState();
}

class InitialInput extends AddressInputState {
  @override
  List<Object?> get props => [];
}

class SearchingName extends AddressInputState {
  @override
  List<Object?> get props => [];
}

class ValidAccount extends AddressInputState {
  final Account account;

  const ValidAccount({required this.account});

  @override
  List<Object?> get props => [account];
}

class SearchError extends AddressInputState {
  final Failure failure;

  const SearchError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
