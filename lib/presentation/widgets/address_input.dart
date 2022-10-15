import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/account.dart';
import '../providers/address_input_state.dart';
import '../providers/providers.dart';

class AddressInput extends HookConsumerWidget {
  const AddressInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: '');

    final addressInputState = ref.watch(addressInputNotifierProvider);
    late final Widget searchResult;
    if (addressInputState is InitialInput) {
      searchResult = const Text("");
    } else if (addressInputState is SearchingName) {
      searchResult = const Align(
        alignment: Alignment.centerLeft,
        child: SizedBox.square(
          dimension: 16,
          child: CircularProgressIndicator(),
        ),
      );
    } else if (addressInputState is ValidAccount) {
      searchResult = Text(addressInputState.account.address);
    } else if (addressInputState is SearchError) {
      searchResult = const Text(
        "Unrecognized name",
        style: TextStyle(color: Colors.red),
      );
    }

    final addButton = IconButton(
      onPressed: addressInputState is ValidAccount
          ? () => _addAccount(ref, addressInputState.account)
          : null,
      icon: const Icon(FeatherIcons.plus),
    );

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(FeatherIcons.search),
                      onPressed: () => _searchName(ref, controller.text),
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) => _searchName(ref, value),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: searchResult,
              ),
              addButton,
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _searchName(WidgetRef ref, String name) async {
    await ref.read(addressInputNotifierProvider.notifier).searchName(name);
  }

  Future<void> _addAccount(WidgetRef ref, Account account) async {
    await ref.read(addressListProvider).addAddress(account);
  }
}
