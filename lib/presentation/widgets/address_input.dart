import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddressInput extends HookWidget {
  const AddressInput({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: "");

    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 12.0, right: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(controller: controller),
              ),
              IconButton(
                onPressed: () {
                  print(controller.text);
                },
                icon: const Icon(FeatherIcons.search),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text("input")),
              IconButton(
                onPressed: () {},
                icon: const Icon(FeatherIcons.plus),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
