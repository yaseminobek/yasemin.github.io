import SwiftUI


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct ContentView: View {
    
    @State private var scoop1: Color? = nil
    @State private var scoop2: Color? = nil
    @State private var scoop3: Color? = nil
    @State private var scoop4: Color? = nil
    @State private var scoop5: Color? = nil
    @State private var count: Int = 0   
    
    var body: some View {
        VStack(spacing: 20) {
            
           
            ZStack {
              
                Triangle()
                    .fill(.brown)
                    .frame(width: 120, height: 150)
            
               
                if let c1 = scoop1 {
                    scoopCircle(color: c1)
                        .offset(y: -70)
                }
                if let c2 = scoop2 {
                    scoopCircle(color: c2)
                        .offset(y: -120)
                }
                if let c3 = scoop3 {
                    scoopCircle(color: c3)
                        .offset(y: -170)
                }
                if let c4 = scoop4 {
                    scoopCircle(color: c4)
                        .offset(y: -220)
                }
                if let c5 = scoop5 {
                    scoopCircle(color: c5)
                        .offset(y: -270)
                }
            }
            .frame(height: 260)
            
            
            HStack {
                Button("Add Scoop") {
                    addScoop()
                }
                Button("Reset") {
                    resetCone()
                }
            }
            .buttonStyle(.borderedProminent)
            
          
            Text("Scoops: \(count)/5")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
    
  
    private func scoopCircle(color: Color) -> some View {
        Circle()
            .fill(color)
            .frame(width: 80, height: 80)
            .overlay(
                Circle().stroke(.white.opacity(0.3), lineWidth: 2)
            )
            .shadow(radius: 3)
    }
    
   
    private func addScoop() {
        if count < 5 {
            count += 1
            if count == 1 { scoop1 = .pink }
            else if count == 2 { scoop2 = .yellow }
            else if count == 3 { scoop3 = .blue }
            else if count == 4 { scoop4 = .mint }
            else if count == 5 { scoop5 = .purple }
        } else {
          
            print("OVERFLOW → resetting to 0")
            resetCone()
        }
    }
    
    private func resetCone() {
        scoop1 = nil
        scoop2 = nil
        scoop3 = nil
        scoop4 = nil
        scoop5 = nil
        count = 0
    }
}
