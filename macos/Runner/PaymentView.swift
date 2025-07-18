import Cocoa
import FlutterMacOS

class PaymentView: NSViewController {
  override func loadView() {
    self.view = NSView()
    self.view.wantsLayer = true
    self.view.layer?.backgroundColor = NSColor.white.cgColor
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let label = NSTextField(labelWithString: "This is a placeholder for future Stripe payment view.")
    label.font = NSFont.systemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(label)

    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
  }
}
