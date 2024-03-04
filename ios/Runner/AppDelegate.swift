import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let appChannel = FlutterMethodChannel(name: "dogapp/channel",
                                              binaryMessenger: controller.binaryMessenger)
      appChannel.setMethodCallHandler({
        [weak self]  (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          guard call.method == "getOSVersion" else {
        result(FlutterMethodNotImplemented)
        return
      }
      let systemVersion = UIDevice.current.systemVersion
      result(systemVersion)
    })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
