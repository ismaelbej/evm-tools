import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../navigation_bar.dart';

final navigatorProvider =
    StateProvider<NavigatorEnum>((ref) => NavigatorEnum.values.first);
