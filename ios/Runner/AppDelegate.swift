import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("rootViewController is not type FlutterViewController")
    }
    
    let requestChannel = FlutterMethodChannel(name: "flutter.native/request",
                                              binaryMessenger: controller.binaryMessenger)
    requestChannel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        
        switch call.method {
        case "getCategories":
            Network().getCategories { (response) in
                result(response)
            }
            
        case "getRandomByCategories":
            let argument = call.arguments as! String
            Network().getRandomByCategories(category: argument) { (response) in
                result(response)
            }
            
        default:
            result(FlutterMethodNotImplemented)
        }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  
}
