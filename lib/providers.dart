import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/navigation_bar.dart';

final navigatorProvider =
    StateProvider<NavigatorEnum>((ref) => NavigatorEnum.blocks);
