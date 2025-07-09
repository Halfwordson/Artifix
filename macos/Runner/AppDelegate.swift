import Cocoa
import FlutterMacOS
import SwiftUI
import Foundation
import GeneratedPluginRegistrant


class AppDelegate: FlutterAppDelegate {
  override func applicationDidFinishLaunching(_ notification: Notification) {
    guard let mainFlutterWindow = NSApp.windows.first else {
      fatalError("🚨 Kunde inte hitta huvudfönstret.")
    }

    if let flutterViewController = mainFlutterWindow.contentViewController as? FlutterViewController {
      let channel = FlutterMethodChannel(
        name: "com.artifix/payment",
        binaryMessenger: flutterViewController.engine.binaryMessenger
      )

      channel.setMethodCallHandler { call, result in
        if call.method == "showPaymentView" {
          let paymentWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 400, height: 300),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
          )
          paymentWindow.center()
          paymentWindow.title = "Betalning"
          paymentWindow.contentViewController = NSHostingController(rootView: PaymentView())
          paymentWindow.makeKeyAndOrderFront(nil)
          result(nil)
        } else {
          result(FlutterMethodNotImplemented)
        }
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    super.applicationDidFinishLaunching(notification)
  }

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}

