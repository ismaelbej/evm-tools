import 'package:flutter/material.dart';

import '../widgets/address_list.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  static const String title = "Addresses";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: const AddressList(),
    );
  }
}
