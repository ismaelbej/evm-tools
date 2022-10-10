import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class AddressList extends ConsumerWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(addressListStreamProvider);
    return item.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      data: (addressList) => ListView.builder(
        itemCount: addressList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(addressList[index].name),
        ),
      ),
    );
  }
}
