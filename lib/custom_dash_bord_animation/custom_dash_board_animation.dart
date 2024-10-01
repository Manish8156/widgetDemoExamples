import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomDashBoardAnimation extends StatefulWidget {
  const CustomDashBoardAnimation({super.key});

  @override
  State<CustomDashBoardAnimation> createState() => _CustomDashBoardAnimationState();
}

class _CustomDashBoardAnimationState extends State<CustomDashBoardAnimation> with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastIconClicked = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];
  int bottomIndex = 0;

  final List<IconData> listOfIcons = [
    Icons.access_alarm,
    Icons.access_time_filled_rounded,
    Icons.home,
    Icons.accessible_outlined,
  ];

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(duration: const Duration(milliseconds: 250), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          side: BorderSide(
            color: Colors.orange.withOpacity(0.5),
            style: BorderStyle.solid,
            width: 3,
          ),
        ),
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
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        gapLocation: GapLocation.center,
        activeIndex: bottomIndex,
        notchMargin: 10,
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
      appBar: AppBar(
        title: const Text('Geeks for Geeks'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({
    required this.menuAnimation,
  }) : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  // shouldRepaint override
  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  // paintChildren override
  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    double dy = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      /// here math.pi/5 is defined the part of elements
      dx = (i == 0) ? 0 : 120 * math.cos(math.pi / 5 * i);
      dy = (i == 0) ? 0 : 109 * math.sin(-math.pi / 5 * i);
      context.paintChild(
        i,
        transform: Matrix4.translationValues(dx * menuAnimation.value, dy * menuAnimation.value, 0),
      );
    }
  }
}

class MultiButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.shade500
      ..style = PaintingStyle.fill;
    final c = Offset(size.width / 2, size.width / 2);
    for (int i = 0; i < 5; i++) {
      canvas.drawCircle(c, 25, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
