import 'package:evm_tools/presentation/pages/addresses_page.dart';
import 'package:evm_tools/presentation/pages/blocks_page.dart';
import 'package:evm_tools/presentation/pages/more_page.dart';
import 'package:evm_tools/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigation_bar.dart';
import '../providers/providers.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final item = ref.watch(navigatorProvider);
          return IndexedStack(
            index: item.index,
            children: const [
              BlocksPage(),
              TransactionsPage(),
              AddressesPage(),
              MorePage(),
            ],
          );
        },
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
