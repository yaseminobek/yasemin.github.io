import SwiftUI

struct ContentView: View {
    @State private var id = 0
    @State private var overflow = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("4-Bit ID Counter")
            
           
            HStack(spacing: 20) {
                Text("Decimal: \(id)")
                Text("Binary: \(b8())\(b4())\(b2())\(b1())")
            }
            
           
            HStack(spacing: 12) {
                bitBox(value: b8())
                bitBox(value: b4())
                bitBox(value: b2())
                bitBox(value: b1())
            }
            
          
            if overflow {
                Text("OVERFLOW!")
                    .foregroundColor(.red)
            }
            
            
            HStack(spacing: 12) {
                Button("Enroll (+1)") {
                    overflow = (id == 15)
                    id = (id + 1) % 16
                }
                Button("Reset (0)") {
                    id = 0
                    overflow = false
                }
            }
            .padding()
        }
    }
    

    func b8() -> Int { (id / 8) % 2 }
    func b4() -> Int { (id / 4) % 2 }
    func b2() -> Int { (id / 2) % 2 }
    func b1() -> Int { id % 2 }
    
    func bitBox(value: Int) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(value == 1 ? Color.green : Color.gray)
                .frame(width: 60, height: 60)
            Text(value == 1 ? "1" : "0")
        }
    }
}
