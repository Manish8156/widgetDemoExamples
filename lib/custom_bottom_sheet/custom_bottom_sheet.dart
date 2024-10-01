import 'package:flutter/material.dart';

import '../custom_cupertino_switch.dart';
import 'curve_painter.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int currentIndex = 0;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: CustomSwitch(
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue = value;
            });
          },
        ),

        /*child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 20,
            right: 20,
            left: 20,
          ),
          child: SizedBox(
            width: double.maxFinite,
            height: 80,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  color: Colors.green,
                  child: CustomPaint(
                    painter: CurvePainter(),
                  ),
                )
              ],
            ),
          ),
        ),*/
      ),
    );
  }
}
