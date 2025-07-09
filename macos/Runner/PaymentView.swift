import SwiftUI

struct PaymentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("15 kr för samtal")
                .font(.title)
                .padding()

            TextField("Valfri kommentar", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Betala") {
                print("🧾 Betalning simulerad")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Tillbaka") {
                NSApplication.shared.keyWindow?.close()
            }
            .padding(.top)
        }
        .frame(width: 300, height: 250)
        .padding()
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}

