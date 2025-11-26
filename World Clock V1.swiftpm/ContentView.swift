import SwiftUI

struct ContentView: View {
    let cities = [
        "🇬🇧 London",
        "🇯🇵 Tokyo",
        "🇺🇸 New York",
        "🇹🇷 Istanbul",
        "🇫🇷 Paris",
        "🇦🇺 Sydney"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("World Clock V1")
                .font(.title)
                .padding(.bottom, 12)
            
            ForEach(cities, id: \.self) { city in
                Text(city)
            }
        }
        .padding()
        .onAppear {
            printWorldClockV1()   
        }
    }
}

func printWorldClockV1() {
    let cities = [
        "🇬🇧 London",
        "🇯🇵 Tokyo",
        "🇺🇸 New York",
        "🇹🇷 Istanbul",
        "🇫🇷 Paris",
        "🇦🇺 Sydney"
    ]
    
    print("🌍 World Clock V1")
    print("------------------")
    for city in cities {
        print(city)
    }
}
