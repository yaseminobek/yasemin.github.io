import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.teal 
                .opacity(0.3)
            let skin = Color(red: 0.82, green: 0.67, blue: 0.52)
            let hair = Color(red: 0.30, green: 0.20, blue: 0.12)
            let eye = Color(red: 0.22, green: 0.15, blue: 0.10)
            let lip = Color(red: 0.95, green: 0.35, blue: 0.50)
            let shirt = Color(red: 0.95, green: 0.35, blue: 0.50)
            
            
            RoundedRectangle(cornerRadius: 200)
                .frame(width: 320, height: 500)
                .offset(y: 50)
                .foregroundStyle(hair)
            Rectangle()
                .frame(width: 80, height: 200)
                .offset(y:200)
                .foregroundStyle(skin)
            
            Capsule()
                .frame(width: 250, height:  300)
                .foregroundStyle(skin)
                .shadow(color: .black, radius: 10)
            
            RoundedRectangle(cornerRadius: 70)
                .foregroundStyle(shirt)
                .frame(width:350, height:400)
                .offset(y:400)
            Circle()
                .trim(from:0.5, to: 1.0)
                .frame(width:275)
                .offset(y: -50)
                .foregroundStyle(hair)
            
            Circle()
                .frame(width: 25, height: 25)
                .foregroundStyle(eye)
                .offset(x: -60, y: -20)
            Circle()
                .frame(width: 25, height: 25)
                .foregroundStyle(eye)
                .offset(x: 60, y: -20)
            Capsule()
                .frame(width: 10, height: 40)
                .foregroundStyle(.brown)
                .offset( y: 20)
            Circle()
                .trim(from: 0.0, to: 0.5)
                .rotationEffect(.degrees(0))
                .frame(width: 80, height: 40)
                .foregroundStyle(lip)
                .offset(y: 90)
            
            
            
        }
    }
}


