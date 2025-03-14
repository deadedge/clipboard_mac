import Cocoa
import FlutterMacOS

public class MousePositionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mouse_position", binaryMessenger: registrar.messenger)
    let instance = MousePositionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "getMousePosition":
      let mousePosition = NSEvent.mouseLocation

      if let screen = NSScreen.screens.first(where: { $0.frame.contains(mousePosition) }) {
        let screenFrame = screen.frame

        let flippedY = screenFrame.height - mousePosition.y

        result(["x": mousePosition.x, "y": flippedY])
      } else {
        result(
          FlutterError(
            code: "MOUSE_OUTSIDE_SCREEN",
            message: "Mouse position is outside of any screen",
            details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
