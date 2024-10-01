import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cubic/cubit.dart';

final helloWorld = Provider<String>(
  (ref) => "HelloWorld",
);

class CubicPage extends StatefulWidget {
  const CubicPage({super.key});

  @override
  State<CubicPage> createState() => _CubicPageState();
}

class _CubicPageState extends State<CubicPage> {
  CubitDemo cubic = CubitDemo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "readValue",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cubic.addNumber();
                      },
                      child: const Text("Add"),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Remove"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
