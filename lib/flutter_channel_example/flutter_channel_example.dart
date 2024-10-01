import 'package:flutter/material.dart';
import 'package:widgets_demo_examples/flutter_channel_example/method_channel_class.dart';

class FlutterChannelExample extends StatefulWidget {
  const FlutterChannelExample({super.key});

  @override
  State<FlutterChannelExample> createState() => _FlutterChannelExampleState();
}

class _FlutterChannelExampleState extends State<FlutterChannelExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$count',
            style: const TextStyle(fontSize: 25, color: Colors.red),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () async {
              final value = await MethodChannelCounter.increment(counterValue: count);
              setState(() {
                count = value;
              });
            },
            child: const Text("Add"),
          ),
          ElevatedButton(
            onPressed: () async {
              final value = await MethodChannelCounter.decrement(counterValue: count);
              setState(() {
                count = value;
              });
            },
            child: const Text("Subtract"),
          )
        ],
      ),
    );
  }
}
