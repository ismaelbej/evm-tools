import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class BlocksPage extends StatelessWidget {
  const BlocksPage({Key? key}) : super(key: key);

  static const String title = "Blocks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Container(),
      floatingActionButton: const ActionButton(),
    );
  }
}

enum FloatingMenuItem {
  camera("Capture", FeatherIcons.camera),
  moon("Space", FeatherIcons.moon),
  key("Secret", FeatherIcons.key),
  save("Old", FeatherIcons.save);

  const FloatingMenuItem(this.label, this.icon);

  final String label;
  final IconData icon;
}

class ActionButton extends StatefulWidget {
  const ActionButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool collapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Wrap(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 12,
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          //if (!collapsed)
          ...FloatingMenuItem.values.map(
            (menu) => FloatinActionButton(
              label: menu.label,
              icon: Icon(
                menu.icon,
                color: Colors.white,
              ),
              collapsed: collapsed,
            ),
          ),
          FloatinActionButton(
            key: const Key("menu-button-key"),
            label: collapsed ? "Open" : "Close",
            icon: AnimatedRotation(
              turns: collapsed ? 0 : 0.125,
              duration: const Duration(milliseconds: 500),
              child: const Icon(
                FeatherIcons.plus,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              setState(() {
                collapsed = !collapsed;
              });
            },
          )
          // FloatingActionButton(
          //   backgroundColor: Colors.yellow,
          //   child: AnimatedRotation(
          //     duration: const Duration(milliseconds: 300),
          //     turns: collapsed ? 0 : 0.125,
          //     child: const Icon(
          //       FeatherIcons.plus,
          //       color: Colors.white,
          //     ),
          //   ),
          //   onPressed: () {},
          // ),
          // const SizedBox.square(dimension: 12),
          // Container(
          //   height: 48,
          //   decoration: BoxDecoration(
          //     // shape: BoxShape.circle,
          //     borderRadius: BorderRadius.circular(24),
          //     color: Colors.white,
          //     boxShadow: kElevationToShadow[4],
          //   ),
          //   child: Material(
          //     color: Colors.transparent,
          //     child: InkWell(
          //       highlightColor: Colors.green.withOpacity(0.2),
          //       splashColor: Colors.yellow.withOpacity(0.8),
          //       borderRadius: BorderRadius.circular(24),
          //       onTap: () {
          //         setState(() {
          //           collapsed = !collapsed;
          //         });
          //       },
          //       child: Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           const Padding(
          //             padding: EdgeInsets.only(
          //               left: 24,
          //               right: 12,
          //             ),
          //             child: Center(
          //               child: Text(
          //                 "Open",
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   color: Colors.orange,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           SizedBox.square(
          //             dimension: 48,
          //             child: Container(
          //               // color: Colors.white,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(24),
          //                 color: Colors.orange,
          //               ),
          //               child: Material(
          //                 color: Colors.transparent,
          //                 child: InkWell(
          //                   highlightColor: Colors.green.withOpacity(0.2),
          //                   splashColor: Colors.yellow.withOpacity(0.8),
          //                   borderRadius: BorderRadius.circular(24),
          //                   child: AnimatedRotation(
          //                     duration: const Duration(milliseconds: 300),
          //                     turns: collapsed ? 0 : 0.125,
          //                     child: const Icon(
          //                       FeatherIcons.plus,
          //                       color: Colors.white,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox.square(dimension: 12),
          // Stack(
          //   children: [
          //     Align(
          //       alignment: Alignment.centerRight,
          //       child: Container(
          //         height: 48,
          //         decoration: BoxDecoration(
          //           // shape: BoxShape.circle,
          //           borderRadius: BorderRadius.circular(24),
          //           color: Colors.white,
          //           boxShadow: kElevationToShadow[4],
          //         ),
          //         child: Material(
          //           color: Colors.transparent,
          //           child: InkWell(
          //             highlightColor: Colors.green.withOpacity(0.2),
          //             splashColor: Colors.yellow.withOpacity(0.8),
          //             borderRadius: BorderRadius.circular(24),
          //             onTap: () {
          //               setState(() {
          //                 collapsed = !collapsed;
          //               });
          //             },
          //             child: const Padding(
          //               padding: EdgeInsets.only(
          //                 left: 24,
          //                 right: 12 + 48,
          //               ),
          //               child: Center(
          //                 child: Text("Open"),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.centerRight,
          //       child: Container(
          //         height: 48,
          //         decoration: BoxDecoration(
          //           // shape: BoxShape.circle,
          //           borderRadius: BorderRadius.circular(24),
          //           color: Colors.pink,
          //           // boxShadow: kElevationToShadow[4],
          //         ),
          //         // child: Material(
          //         //   color: Colors.transparent,
          //         //   child: InkWell(
          //         //     highlightColor: Colors.green.withOpacity(0.2),
          //         //     splashColor: Colors.yellow.withOpacity(0.8),
          //         //     borderRadius: BorderRadius.circular(24),
          //         //     onTap: () {
          //         //       setState(() {
          //         //         collapsed = !collapsed;
          //         //       });
          //         //     },
          //         child: SizedBox.square(
          //           dimension: 48,
          //           child: AnimatedRotation(
          //             duration: const Duration(milliseconds: 300),
          //             turns: collapsed ? 0 : 0.125,
          //             child: const Icon(
          //               FeatherIcons.plus,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //         //   ),
          //         // ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class FloatinActionButton extends StatefulWidget {
  const FloatinActionButton({
    Key? key,
    required this.label,
    required this.icon,
    this.collapsed = false,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool collapsed;

  @override
  State<FloatinActionButton> createState() => _FloatinActionButtonState();
}

class _FloatinActionButtonState extends State<FloatinActionButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..reverse();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              boxShadow: kElevationToShadow[4],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.orange,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.yellow.withOpacity(0.2),
            splashColor: Colors.yellow.withOpacity(0.3),
            borderRadius: BorderRadius.circular(24),
            onTap: () => widget.onPressed?.call(),
            child: SizedBox(
              height: 48,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!widget.collapsed)
                    SizeTransition(
                      sizeFactor: _animation,
                      axis: Axis.horizontal,
                      axisAlignment: -1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 16,
                        ),
                        child: Center(
                          child: Text(
                            widget.label,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox.square(
                    dimension: 48,
                    child: widget.icon,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/* 
AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: collapsed ? 0 : 0.125,
                        child: const Icon(
                          FeatherIcons.plus,
                          color: Colors.white,
                        ),
                      ) */