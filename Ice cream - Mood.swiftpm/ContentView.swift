import SwiftUI

struct Mood: Identifiable {
    let id = UUID()
    let name: String
    let level: Int      // 1–5 “energy level”
    let color: Color
}

struct ContentView: View {
    let moods: [Mood] = [
        Mood(name: "Calm",     level: 1, color: .blue.opacity(0.5)),
        Mood(name: "Tired",    level: 2, color: .gray),
        Mood(name: "Focused",  level: 3, color: .teal),
        Mood(name: "Happy",    level: 4, color: .yellow),
        Mood(name: "Excited",  level: 5, color: .orange)
    ]
    
    var maxLevel: Int {
        moods.map { $0.level }.max() ?? 1
    }
    
    var averageLevel: Double {
        let total = moods.map { $0.level }.reduce(0, +)
        return Double(total) / Double(moods.count)
    }
    
    var body: some View {
        ZStack {
            // dark background so colors pop
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.purple.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                VStack(spacing: 4) {
                    Text("Mood Energy Meter")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Text("Higher numbers = longer, brighter bars")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 16)
                
                // main card with the moods
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 6)
                    
                    VStack(spacing: 12) {
                        ForEach(moods) { mood in
                            MoodRow(mood: mood, maxLevel: maxLevel)
                        }
                    }
                    .padding(16)
                }
                .padding(.horizontal, 16)
                
                Text(String(format: "Average mood level: %.1f", averageLevel))
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}

struct MoodRow: View {
    let mood: Mood
    let maxLevel: Int
    
    var body: some View {
        HStack {
            Text(mood.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
            
            GeometryReader { geo in
                let fullWidth = geo.size.width
                let ratio = CGFloat(mood.level) / CGFloat(maxLevel)
                
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 18)
                    
                    Capsule()
                        .fill(mood.color)
                        .frame(width: fullWidth * ratio, height: 18)
                }
            }
            .frame(height: 18)
            .overlay(
                Text("\(mood.level)")
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding(.horizontal, 6),
                alignment: .center
            )
            .frame(width: 160)   // keep all rows aligned
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
