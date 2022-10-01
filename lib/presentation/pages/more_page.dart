import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  static const String title = "More...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Container(),
    );
  }
}
