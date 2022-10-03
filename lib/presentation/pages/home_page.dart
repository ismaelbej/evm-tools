import 'package:evm_tools/presentation/pages/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigation_bar.dart';
import '../providers/providers.dart';
import 'addresses_page.dart';
import 'settings_page.dart';

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
              AddressesPage(),
              SettingsPage(),
              TransactionsPage(),
            ],
          );
        },
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
