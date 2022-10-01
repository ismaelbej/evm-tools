import 'package:flutter/material.dart';

class BlocksPage extends StatelessWidget {
  const BlocksPage({Key? key}) : super(key: key);

  static const String title = "Blocks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Container(),
    );
  }
}
