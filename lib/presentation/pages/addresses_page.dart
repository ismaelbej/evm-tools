import 'package:flutter/material.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  static const String title = "Addresses";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Container(),
    );
  }
}
