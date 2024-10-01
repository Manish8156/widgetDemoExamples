import 'dart:math' as math;

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'custom_dash_bord_animation/custom_dash_board_animation.dart';

class ReorderableAndDismissibleList extends StatefulWidget {
  const ReorderableAndDismissibleList({super.key});

  @override
  State<ReorderableAndDismissibleList> createState() => _ReorderableAndDismissibleListState();
}

class _ReorderableAndDismissibleListState extends State<ReorderableAndDismissibleList> {
  // late AnimationController menuAnimation;
  IconData lastIconClicked = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];
  final List<int> listOfItems = List.generate(50, (index) => index);
  int bottomIndex = 0;
  final List<IconData> listOfIcons = [
    Icons.access_alarm,
    Icons.access_time_filled_rounded,
    Icons.home,
    Icons.accessible_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    debugPrint('math.pi::${math.pi}');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reorderable and Dismissible list"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      // floatingActionButton: Flow(
      //   delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      //   children: menuItems
      //       .map<Widget>((IconData icon) => Align(
      //             alignment: Alignment.bottomCenter,
      //             child: FloatingActionButton(
      //               clipBehavior: Clip.hardEdge,
      //               disabledElevation: 0,
      //               focusElevation: 0,
      //               elevation: 0,
      //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //               backgroundColor: lastIconClicked == icon ? Colors.orangeAccent : Colors.grey,
      //               splashColor: Colors.orangeAccent,
      //               onPressed: () {
      //                 if (icon != Icons.menu) {
      //                   setState(() {
      //                     lastIconClicked = icon;
      //                   });
      //                 }
      //                 menuAnimation.status == AnimationStatus.completed
      //                     ? menuAnimation.reverse()
      //                     : menuAnimation.forward();
      //               },
      //               child: Icon(icon),
      //             ),
      //           ))
      //       .toList(),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        gapLocation: GapLocation.center,
        activeIndex: bottomIndex,
        notchMargin: 8,
        notchSmoothness: NotchSmoothness.smoothEdge,
        tabBuilder: (int index, bool isActive) {
          return Icon(
            listOfIcons[index],
            size: 24,
            color: isActive ? Colors.orange : Colors.yellow,
          );
        },
        onTap: (p0) {
          setState(() {
            bottomIndex = p0;
          });
        },
        hideAnimationCurve: Curves.easeIn,
        itemCount: listOfIcons.length,
      ),
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 88,
            bottom: -MediaQuery.of(context).padding.bottom - 45,
            child: Container(
              width: 176,
              height: 176,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: math.pi / 1.14,
                child: CustomPaint(
                  painter: ShapePainter(),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ReorderableListView(
                    children: [
                      for (int index = 0; index < listOfItems.length; index++)
                        Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            setState(() {
                              listOfItems.removeAt(index);
                            });
                          },
                          background: Container(color: Colors.red),
                          child: ListTile(
                            key: Key('$index'),
                            tileColor: (index.isEven) ? Colors.green.shade200 : Colors.grey.shade500,
                            title: Text("Item : ${listOfItems[index]} "),
                          ),
                        )
                    ],
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final item = listOfItems.removeAt(oldIndex);
                        listOfItems.insert(newIndex, item);
                      });
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;
    Offset center = Offset(size.width / 2, size.height / 2);
    for (int i = 1; i <= 4; i++) {
      canvas.drawCircle(
        Offset(
          62 * math.cos(math.pi * i / 4) + center.dx,
          62 * math.sin(math.pi * i / 4) + center.dy,
        ),
        20,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
