import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:widgets_demo_examples/animated_watch/watchPainter.dart';

class AnimatedWatch extends StatefulWidget {
  const AnimatedWatch({super.key});

  @override
  State<AnimatedWatch> createState() => _AnimatedWatchState();
}

class _AnimatedWatchState extends State<AnimatedWatch> with TickerProviderStateMixin {
  late AnimationController secondController;
  late AnimationController minuteController;
  late AnimationController hourController;
  late AnimationController daysController;

  double minuteAngle = 0;
  double hourAngle = 0;

  void angleClock(
    int hour,
    int minutes,
  ) {
    minuteAngle = minutes * 6;
    hourAngle = (hour * 30) + (minutes * 0.5);
  }

  @override
  void initState() {
    angleClock((DateTime.now().hour - 12).abs(), DateTime.now().minute);
    debugPrint(
        'DateTime.now().hour${(DateTime.now().hour - 12).abs()},, DateTime.now().minute${DateTime.now().minute}');
    debugPrint(']======> $minuteAngle,,,,,,$hourAngle');
    debugPrint('===> current andle of minute ${(minuteAngle * (math.pi / 180))}');
    secondController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
    minuteController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 60),
    );
    hourController = AnimationController(
      vsync: this,
      duration: const Duration(hours: 12),
    );
    daysController = AnimationController(
      vsync: this,
      duration: const Duration(days: 7),
    );
    daysController.repeat();
    hourController.repeat();
    minuteController.repeat();
    secondController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 400,
          width: double.maxFinite,
          color: Colors.grey.withOpacity(0.2),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: hourController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: hourAngle * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: CustomPaint(
                    painter: PaintHourDial(hourAngle: hourAngle),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: minuteController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: (minuteAngle * (math.pi / 180)),
                      child: child,
                    );
                  },
                  child: CustomPaint(
                    painter: PaintMinuteDial(minuteAngle: minuteAngle),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: secondController.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  animation: secondController,
                  child: CustomPaint(
                    painter: PaintSecondDial(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomPaint(
                  painter: WatchPainter(),
                ),
              ),
              Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width / 2 - 40,
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.red,
                  height: 86,
                  width: 86,
                  // color: Colors.cyan,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: daysController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: daysController.value * 2 * math.pi,
                            child: child,
                          );
                        },
                        child: CustomPaint(
                          painter: PaintDaysDial(),
                        ),
                      ),
                      CustomPaint(
                        painter: PaintDayWatch(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
