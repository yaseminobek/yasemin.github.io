import SwiftUI
struct ContentView: View {
    @State var hour: Int = 10
    @State var minuteSeg: Int = 0
    func angleForMinuteSeg(_ seg: Int) -> Double {
        if seg == 0 { return -90 }
        else if seg == 1 { return 0 }
        else if seg == 2 { return 90 }
        else { return 180 }
    }
    func angleForHour(_ h: Int) -> Double {
        var h12 = h
        if h12 >= 12 { h12 = h12 - 12 }
        return Double(h12) * 30.0 - 90.0
    }
    func twoDigits(_ n: Int) -> String {
        if n < 10 { return "0" + String(n) }
        else { return String(n) }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            
            ZStack {
                if hour < 12 {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 220, height: 220)
                        .overlay(Circle().stroke(.black, lineWidth: 4))
                        .opacity(0.9)
                } else {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 220, height: 220)
                        .overlay(Circle().stroke(.black, lineWidth: 4))
                        .opacity(0.9)
                }
                VStack {
                    Text("12").font(.caption).bold().padding(.top, 6)
                    Spacer()
                    Text("6").font(.caption).bold().padding(.bottom, 6)
                }
                .frame(width: 220, height: 220)
                
                Capsule()
                    .fill(.black)
                    .frame(width: 8, height: 60)  // kısa
                    .offset(y: -30)
                    .rotationEffect(.degrees(angleForHour(hour)))
                Capsule()
                    .fill(.black)
                    .frame(width: 5, height: 90)  // uzun
                    .offset(y: -45)
                    .rotationEffect(.degrees(angleForMinuteSeg(minuteSeg)))
                Circle()
                    .fill(.black)
                    .frame(width: 12, height: 12)
            }
            .frame(height: 260)
            HStack {
                Text(hour < 12 ? "AM" : "PM")
                    .font(.title3)
                    .padding(8)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Spacer()
                
                Text("\(twoDigits(hour)):\(twoDigits(minuteSeg * 15))")
                    .font(.title3)
                    .monospacedDigit()
                    .padding(8)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.horizontal)
        }
        .padding()
        .onTapGesture {
            if minuteSeg < 3 {
                minuteSeg = minuteSeg + 1
            } else {
                minuteSeg = 0
                hour = hour + 1
                if hour == 24 { hour = 0 } 
            }
        }
    }
}
