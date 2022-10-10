import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/app.dart';
import 'data/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFakeServices();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
