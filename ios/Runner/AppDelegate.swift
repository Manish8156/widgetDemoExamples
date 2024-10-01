import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  GeneratedPluginRegistrant.register(with: self)

        // Add your Google Maps API key
          GMSServices.provideAPIKey("AIzaSyCLpjxLtdM_zh9z5vJs_wnXmDD-Dp6zZ_M")
//    let binaryMessenger = flutterViewController.engine!.binaryMessenger
//          binaryMessenger.setMessageHandlerOnChannel("foo", binaryMessageHandler: { message, reply in
//              // Ensure proper byte order.
//                   guard let message = message else {
//                       reply(nil)
//                       return
//                   }
//                   // Decode the binary data to UTF-8 string.
//                   if let data = String(data: message, encoding: .utf8) {
//                       let x = message.debugDescription // Convert the message to a string for demonstration.
//                       // Display an alert with the received message.
//                       let alertController = UIAlertController(
//                           title: "Message from Flutter",
//                           message: data,
//                           preferredStyle: .alert
//                       )
//                       alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                       flutterViewController.present(alertController, animated: true, completion: nil)
//                   }
//                   reply(nil)
//          }
//        )
 let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
         // FlutterMethodChannel to handle communication between Flutter and the platform.
         FlutterMethodChannel(name: "methodChannelDemo", binaryMessenger: controller.binaryMessenger)
             .setMethodCallHandler { call, result in
                 //call represents the incoming method call from Flutter
                 //result represents result or response that you send back to Flutter after handling the method call.
                 // Retrieve the 'count' argument from the method call, if provided.
                 let count = (call.arguments as? NSDictionary)?["value"] as? Int

                 // Determine which method was called from Flutter.
                 switch call.method {
//                  case "random":
//                      // Generate a random number between 0 and 100 and send it back to Flutter as a result.
//                      result(Int.random(in: 0..<100))
                 case "increment", "decrement":
                     if count == nil {
                         // If the 'count' argument is missing or invalid, send a FlutterError back to Flutter.
                         result(FlutterError(code: "INVALID ARGUMENT", message: "Invalid Argument", details: nil))
                     } else {
                         // If the 'count' argument is valid, perform the requested operation.
                         let updatedCount = call.method == "increment" ? count! + 1 : count! - 1
                         result(updatedCount)
                     }
                 default:
                     // Handle any other method calls that are not implemented.
                     result(FlutterMethodNotImplemented)
                 }
             }

             return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
