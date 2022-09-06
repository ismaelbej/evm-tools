import 'package:flutter/material.dart';

import 'presentation/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Evm tools',
      home: MyHomePage(title: 'Evm tools'),
      debugShowCheckedModeBanner: false,
    );
  }
}
