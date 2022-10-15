import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import 'address_input.dart';

class AddressList extends ConsumerWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressListValue = ref.watch(addressListStreamProvider);
    return addressListValue.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      data: (addressList) => ListView.builder(
        itemCount: addressList.length + 1,
        itemBuilder: (context, index) => (index == 0)
            ? const AddressInput()
            : GestureDetector(
                child: ListTile(
                  title: Text(addressList[index - 1].name),
                ),
              ),
      ),
    );
  }
}
