import SwiftUI
struct ContentView: View {
    @State var hour: Int = 12
    @State var minuteSeg: Int = 1  
    
    
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
    
    
    let faceColor = Color(red: 60/255, green: 90/255, blue: 70/255)  
    let ringColor = Color.black.opacity(0.7)
    let textColor = Color.white
    let handColor = Color.black
    
    var body: some View {
        ZStack {
          
            
            VStack(spacing: 16) {
                
                ZStack {
                    
                    Circle()
                        .fill(faceColor)
                        .frame(width: 260, height: 260)
                        .overlay(Circle().stroke(ringColor, lineWidth: 6))
                    
                    
                    Group {
                        Text("12").offset(y: -110)
                        Text("1").offset(x: 68,  y: -95)
                        Text("2").offset(x: 105, y: -58)
                        Text("3").offset(x: 120, y: 0)
                        Text("4").offset(x: 105, y: 58)
                        Text("5").offset(x: 68,  y: 95)
                        Text("6").offset(y: 110)
                        Text("7").offset(x: -68, y: 95)
                        Text("8").offset(x: -105, y: 58)
                        Text("9").offset(x: -120, y: 0)
                        Text("10").offset(x: -105, y: -58)
                        Text("11").offset(x: -68,  y: -95)
                    }
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(textColor)
                    
                    Capsule()
                        .fill(handColor)
                        .frame(width: 10, height: 78)
                        .offset(y: -39)
                        .rotationEffect(.degrees(angleForHour(hour)))
                    
                    
                    Capsule()
                        .fill(handColor)
                        .frame(width: 6, height: 110)
                        .offset(y: -55)
                        .rotationEffect(.degrees(angleForMinuteSeg(minuteSeg)))
                    
                    
                    Circle()
                        .fill(handColor)
                        .frame(width: 12, height: 12)
                }
                .frame(height: 300)
                
                
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
                
                Text("Tap the clock to add 15 minutes")
                    .font(.footnote)
                    .foregroundStyle(.black.opacity(0.7))
            }
            .padding()
        }
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
       
