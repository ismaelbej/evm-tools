import 'package:flutter/material.dart';

class NavigationBarItem {
  final IconData icon;
  final String label;

  const NavigationBarItem({
    required this.icon,
    required this.label,
  });
}

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  static const List<NavigationBarItem> _items = [
    NavigationBarItem(icon: Icons.grid_view, label: "Blocks"),
    NavigationBarItem(icon: Icons.reorder, label: "Transactions"),
    NavigationBarItem(icon: Icons.folder_outlined, label: "Addresses"),
    NavigationBarItem(icon: Icons.more_vert, label: "More"),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
      type: BottomNavigationBarType.fixed,
    );
  }
}
