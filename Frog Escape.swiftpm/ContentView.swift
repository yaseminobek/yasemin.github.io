import SwiftUI


func initialTimeForLevel(level: Int) -> Int {
    if level == 1 { return 20 }
    else if level == 2 { return 18 }
    else if level == 3 { return 16 }
    else if level == 4 { return 14 }
    else { return 8 }
}

struct ContentView: View {
    
    @State private var level = 1
    @State private var time = 20
    @State private var playing = false
    
   
    let areaWidth: CGFloat = 300
    let areaHeight: CGFloat = 240
    
   
    @State private var x: CGFloat = 40    
    @State private var y: CGFloat = 170  
    let playerSize: CGFloat = 24
    
   
    let obstacleX: CGFloat = 150
    let obstacleY: CGFloat = 150
    let obstacleW: CGFloat = 80
    let obstacleH: CGFloat = 22
    
  
    let goalX: CGFloat = 284   
    let step: CGFloat = 12
    
    
    let tick = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text("\(time)s").font(.title2).bold()
            Text("Level \(level)").font(.headline)
            
           
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.secondary, lineWidth: 2)
                    .frame(width: areaWidth, height: areaHeight)
                
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 16, height: areaHeight - 20)
                    .position(x: goalX, y: areaHeight/2)
                
               
                Rectangle()
                    .fill(.red)
                    .frame(width: obstacleW, height: obstacleH)
                    .position(x: obstacleX, y: obstacleY)
                
               
                Circle()
                    .fill(.blue)
                    .frame(width: playerSize, height: playerSize)
                    .position(x: x, y: y)
            }
            .frame(width: areaWidth, height: areaHeight)
            
          
            VStack(spacing: 8) {
                HStack {
                    Spacer()
                    Button("⬆️") { moveUp() }
                    Spacer()
                }
                HStack(spacing: 12) {
                    Button("⬅️") { moveLeft() }
                    Button(playing ? "Restart" : "Start") { startGame() }
                    Button("➡️") { moveRight() }
                }
                HStack {
                    Spacer()
                    Button("⬇️") { moveDown() }
                    Spacer()
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text("Reach the green bar • Avoid the red block • Beat the clock")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .onReceive(tick) { _ in
            if playing {
                if time > 0 {
                    time -= 1
                } else {
                 
                    print("Time up! Restarting…")
                    resetToLevel1()
                }
                
              
                if touchingObstacle() {
                    print("Hit obstacle! Restarting…")
                    resetToLevel1()
                } else if reachedGoal() {
                    level += 1
                    time = initialTimeForLevel(level: level)
                    x = 40
                    y = 170
                }
            }
        }
    }
    

    
    func startGame() {
        level = 1
        time = initialTimeForLevel(level: level)
        x = 40
        y = 170
        playing = true
    }
    
    func resetToLevel1() {
        level = 1
        time = initialTimeForLevel(level: level)
        x = 40
        y = 170
    }
    
    func moveLeft()  { if playing { x = max(15, x - step) } }
    func moveRight() { if playing { x = min(areaWidth - 15, x + step) } }
    func moveUp()    { if playing { y = max(15, y - step) } }
    func moveDown()  { if playing { y = min(areaHeight - 15, y + step) } }
    
    func touchingObstacle() -> Bool {
      
        let px = x, py = y, ps = playerSize
        let playerLeft = px - ps/2
        let playerRight = px + ps/2
        let playerTop = py - ps/2
        let playerBottom = py + ps/2
        
        let obsLeft = obstacleX - obstacleW/2
        let obsRight = obstacleX + obstacleW/2
        let obsTop = obstacleY - obstacleH/2
        let obsBottom = obstacleY + obstacleH/2
        
        let overlapX = !(playerRight < obsLeft || playerLeft > obsRight)
        let overlapY = !(playerBottom < obsTop || playerTop > obsBottom)
        return overlapX && overlapY
    }
    
    func reachedGoal() -> Bool {
        return x >= goalX - 10
    }
}
