import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSPanel {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)
  
    
    self.isFloatingPanel = true 
    self.level = .floating 
    self.collectionBehavior.insert(.canJoinAllSpaces) 
    self.collectionBehavior.insert(.fullScreenAuxiliary) 
    self.hidesOnDeactivate = false 
    super.awakeFromNib()
  }
 
}
