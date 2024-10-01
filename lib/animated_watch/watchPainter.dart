import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class WatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintOuterCircle = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange.shade500
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;
    final paintCircleLine = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orange.shade500
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    final pointDots = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.grey.shade500
      ..strokeWidth = 6;
    final center = Offset(size.width / 2, size.height / 2);
    TextPainter textPainter = TextPainter();

    List<Offset> listOfPoints = [];
    canvas.drawCircle(center, 150, paintOuterCircle);
    for (int i = 0; i < 60; i++) {
      if ((i % 5 == 0)) {
        canvas.drawLine(
          Offset(
            150 * math.cos((math.pi * 2 / 60) * i),
            150 * math.sin((math.pi * 2 / 60) * i),
          ),
          Offset(
            134 * math.cos((math.pi * 2 / 60) * i),
            134 * math.sin((math.pi * 2 / 60) * i),
          ),
          paintCircleLine,
        );
      } else {
        canvas.drawLine(
          Offset(
            150 * math.cos((math.pi * 2 / 60) * i),
            150 * math.sin((math.pi * 2 / 60) * i),
          ),
          Offset(
            142 * math.cos((math.pi * 2 / 60) * i),
            142 * math.sin((math.pi * 2 / 60) * i),
          ),
          paintCircleLine,
        );
      }
    }
    for (int j = 1; j <= 12; j++) {
      textPainter
        ..text = TextSpan(text: "$j", style: GoogleFonts.ribeyeMarrow(fontSize: 24))
        ..textDirection = TextDirection.rtl
        ..layout()
        ..paint(
          canvas,
          Offset(
            120 * math.cos(((math.pi * 2 / 12) * j) - math.pi / 2) - 7,
            120 * math.sin(((math.pi * 2 / 12) * j) - math.pi / 2) - 16,
          ),
        );
    }
    canvas.drawCircle(center, 5, pointDots);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PaintSecondDial extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paintDial = Paint()
      ..strokeWidth = 1
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(66, 66);
    path.close();
    canvas.drawPath(path, paintDial);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PaintMinuteDial extends CustomPainter {
  final double minuteAngle;
  PaintMinuteDial({required this.minuteAngle});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paintDial = Paint()
      ..strokeWidth = 2
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(52, 52);
    path.close();
    canvas.drawPath(path, paintDial);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PaintHourDial extends CustomPainter {
  final double hourAngle;
  PaintHourDial({required this.hourAngle});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paintDial = Paint()
      ..strokeWidth = 3
      ..color = Colors.red.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(38, 38);
    path.close();
    canvas.drawPath(path, paintDial);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

enum Days { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

class PaintDayWatch extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    TextPainter daysText = TextPainter();
    final paintCircleFirst = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    final paintCircleSecond = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    final pointDots = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red.shade500
      ..strokeWidth = 6;

    for (int i = 0; i < Days.values.length; i++) {
      daysText
        ..text = TextSpan(
            text: Days.values[i].name,
            style: GoogleFonts.oleoScript(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ))
        ..textDirection = TextDirection.rtl
        ..layout()
        ..paint(
          canvas,
          Offset(
            26 * math.cos(((math.pi * 2 / 7) * i) - math.pi / 2) - 7,
            26 * math.sin(((math.pi * 2 / 7) * i) - math.pi / 2) - 4,
          ),
        );
    }

    final c = Offset(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(c, 3, pointDots);
    canvas.drawCircle(c, 16, paintCircleFirst);
    canvas.drawCircle(c, 37, paintCircleSecond);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PaintDaysDial extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paintDial = Paint()
      ..strokeWidth = 2
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(8, 8);
    path.close();
    canvas.drawPath(path, paintDial);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
