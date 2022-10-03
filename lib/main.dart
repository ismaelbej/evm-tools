import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/app.dart';
import 'services.dart';

void main() async {
  await initializeServices();
  runApp(const ProviderScope(child: MyApp()));
}
