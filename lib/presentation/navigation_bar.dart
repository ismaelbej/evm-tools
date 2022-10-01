import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/providers.dart';

enum NavigatorEnum {
  blocks(FeatherIcons.grid, "Blocks"),
  transactions(FeatherIcons.alignJustify, "Transactions"),
  addresses(FeatherIcons.fileText, "Addresses"),
  more(FeatherIcons.moreVertical, "more");

  final IconData icon;
  final String label;

  const NavigatorEnum(this.icon, this.label);
}

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final item = ref.watch(navigatorProvider);
        return BottomNavigationBar(
          items: NavigatorEnum.values
              .map(
                (value) => BottomNavigationBarItem(
                  icon: Icon(value.icon),
                  label: value.label,
                ),
              )
              .toList(),
          currentIndex: item.index,
          onTap: (index) => ref.read(navigatorProvider.notifier).state =
              NavigatorEnum.values[index],
          type: BottomNavigationBarType.fixed,
        );
      },
    );
  }
}
