import 'package:evm_tools/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigatorEnum {
  blocks(Icons.grid_view, "Blocks"),
  transactions(Icons.folder_outlined, "Transactions"),
  addresses(Icons.grid_view, "Addresses"),
  more(Icons.more_vert, "more");

  final IconData icon;
  final String label;

  const NavigatorEnum(this.icon, this.label);
}

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
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
    });
  }
}
