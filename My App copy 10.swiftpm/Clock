
import SwiftUI

struct ContentView: View {
    @State var hour: Int = 12          
    @State var minuteSeg: Int = 1     
    

    let faceColor = Color(red: 60/255, green: 90/255,  blue: 70/255)  
    let ringColor = Color.black.opacity(0.7)
    let textColor = Color.white
    let handColor = Color.black
    
 
    var minutes: Int { minuteSeg * 15 }
    var isAM: Bool { hour < 12 }
 
    func angleForMinuteSeg(_ seg: Int) -> Double {
   
        switch seg {
        case 0: return -90
        case 1: return   0
        case 2: return  90
        default: return 180
        }
    }
    func angleForHour(_ h: Int, minuteSeg: Int) -> Double {
        let h12 = Double(h % 12)
        let minute = Double(minuteSeg * 15)
       
        return (h12 * 30.0 + minute * 0.5) - 90.0
    }
    
    func twoDigits(_ n: Int) -> String {
        n < 10 ? "0\(n)" : String(n)
    }
    
    var body: some View {
        ZStack {
          
            (isAM ? Color.white : Color.black)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.25), value: isAM)
            
            VStack(spacing: 18) {
             
                ZStack {
                    Circle()
                        .fill(faceColor)
                        .frame(width: 260, height: 260)
                        .overlay(Circle().stroke(ringColor, lineWidth: 6))
                    
                   
                    Group {
                        Text("12").offset(y: -110)
                        Text("1").offset(x:  68, y:  -95)
                        Text("2").offset(x: 105, y:  -58)
                        Text("3").offset(x: 120, y:    0)
                        Text("4").offset(x: 105, y:   58)
                        Text("5").offset(x:  68, y:   95)
                        Text("6").offset(y:  110)
                        Text("7").offset(x: -68, y:   95)
                        Text("8").offset(x: -105, y:  58)
                        Text("9").offset(x: -120, y:   0)
                        Text("10").offset(x:-105, y: -58)
                        Text("11").offset(x: -68, y: -95)
                    }
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(textColor)
                    
                  
                    Capsule()
                        .fill(handColor)
                        .frame(width: 10, height: 78)
                        .offset(y: -39)
                        .rotationEffect(.degrees(angleForHour(hour, minuteSeg: minuteSeg)))
                        .animation(.spring(response: 0.25, dampingFraction: 0.85),
                                   value: hour)
                        .animation(.spring(response: 0.25, dampingFraction: 0.85),
                                   value: minuteSeg)
                    
                  
                    Capsule()
                        .fill(handColor)
                        .frame(width: 6, height: 110)
                        .offset(y: -55)
                        .rotationEffect(.degrees(angleForMinuteSeg(minuteSeg)))
                        .animation(.spring(response: 0.25, dampingFraction: 0.85),
                                   value: minuteSeg)
                    
                    
                    Circle()
                        .fill(handColor)
                        .frame(width: 12, height: 12)
                }
                .frame(height: 300)
              
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        nextMinute()
                    }
                }
               
                .onTapGesture(count: 2) {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        hour = 0
                        minuteSeg = 0
                    }
                }
                
              
                HStack {
                    Text(isAM ? "AM" : "PM")
                        .font(.title3)
                        .padding(8)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer()
                    
                    Text("\(twoDigits(hour)):\(twoDigits(minutes))")
                        .font(.title3).monospacedDigit()
                        .padding(8)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)
                
          
                HStack(spacing: 12) {
                    Button("− Hour") { withAnimation(.easeOut(duration: 0.15)) { decrementHour() } }
                    Button("+ Hour") { withAnimation(.easeOut(duration: 0.15)) { incrementHour() } }
                    Button("Next Minute") { withAnimation(.easeInOut(duration: 0.15)) { nextMinute() } }
                }
                .buttonStyle(.borderedProminent)
                .tint(isAM ? .teal : .green)
                
                VStack(spacing: 8) {
                    Text("Hour: \(hour)")
                        .foregroundStyle(isAM ? .black : .white.opacity(0.9))
                    Slider(value: Binding(
                        get: { Double(hour) },
                        set: { hour = Int($0.rounded()) }
                    ), in: 0...23, step: 1)
                    .tint(isAM ? .teal : .green)
                }
                .padding(.horizontal)
                
                
                Text("Tap = +15m • Double-tap = reset")
                    .font(.footnote)
                    .foregroundStyle(.black.opacity(0.6))
            }
            .padding()
        }
    }
    
    private func incrementHour() { hour = (hour + 1) % 24 }
    private func decrementHour() { hour = (hour + 23) % 24 }
    private func nextMinute() {
        if minuteSeg < 3 {
            minuteSeg += 1
        } else {
            minuteSeg = 0
            hour = (hour + 1) % 24
        }
    }
}
