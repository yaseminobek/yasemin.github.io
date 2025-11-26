import SwiftUI

struct ContentView: View {
    let snacks = ["Pizza", "Burger", "Burrito", "Sushi"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("My Array Map V1 – Super Snack List")
                .font(.headline)
                .padding(.bottom, 12)
            
            
            Text("Index 0: \(snacks[0])")
            Text("Index 1: \(snacks[1])")
            Text("Index 2: \(snacks[2])")
            Text("Index 3: \(snacks[3])")
            
           
            Text("Count: \(snacks.count)")
                .padding(.top, 12)
        }
        .padding()
    }
}
