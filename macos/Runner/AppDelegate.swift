import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationDidFinishLaunching(_ notification: Notification) {
    if let window = NSApp.windows.first {
      // Define tamanho fixo
      let fixedSize = NSSize(width: 200, height: 370)
      window.setContentSize(fixedSize)
      window.minSize = fixedSize
      window.maxSize = fixedSize
    }
    super.applicationDidFinishLaunching(notification)
  }
  
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
