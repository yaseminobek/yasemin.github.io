import SwiftUI
// TODO: Convert a decimal (0–15) into a 4-bit binary string
func decimalToBinary(_ number: Int) -> String {
    // your code here
    let b8 = (number / 8) % 2   
    let b4 = (number / 4) % 2   
    let b2 = (number / 2) % 2   
    let b1 = number % 2        
    return "\(b8)\(b4)\(b2)\(b1)"
}

struct ContentView: View {
    var body: some View {
        Text("Open the console (⌘⇧Y)")
            .onAppear {
                var id = 0
                for _ in 1...20 {
                    print("Decimal: \(id), Binary: \(decimalToBinary(id))")
                    id += 1
                    if id > 15 { id = 0 }
                }   
            }
    }
}
