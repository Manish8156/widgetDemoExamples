// import 'package:app_links/app_links.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:developer';
//
// import 'package:flutter/widgets.dart';
// import 'package:widgets_demo_examples/deep_linking/context_utility.dart';
// import 'package:widgets_demo_examples/deep_linking/green_page.dart';
// import 'package:widgets_demo_examples/deep_linking/red_page.dart';
//
// class AppLinkServices {
//   static String _code = '';
//   static String get code => _code;
//   static bool get hasCode => code.isNotEmpty;
//
//   static void reset() => _code = '';
//
//   static init() async {
//     try {
//       final Uri? uri = await AppLinks().getInitialLink();
//       appLinkHandler(uri);
//     } on PlatformException {
//       log("failed to receive the code");
//     } on FormatException {
//       log("wrong format code receive");
//     }
//     AppLinks().uriLinkStream.listen((event) {
//       appLinkHandler(event);
//     }, onError: (e) {
//       log('OnUriLink Error : $e');
//     });
//   }
//
//   static appLinkHandler(Uri? uri) {
//     if ((uri == null) || (uri.queryParameters.isEmpty)) return;
//
//     Map<String, String> result = uri.queryParameters;
//     String getCode = result['code'] ?? '';
//     if (getCode == 'green') {
//       Navigator.push(
//           ContextUtility.context!,
//           MaterialPageRoute(
//             builder: (context) => const GreenPage(),
//           ));
//     } else {
//       Navigator.push(
//           ContextUtility.context!,
//           MaterialPageRoute(
//             builder: (context) => const RedPage(),
//           ));
//     }
//   }
// }
