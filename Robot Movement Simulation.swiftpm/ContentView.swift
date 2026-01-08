import SwiftUI

struct Cell: Equatable, Hashable {
    var r: Int
    var c: Int
}

struct ContentView: View {
    let N = 7
    
    @State private var bot = Cell(r: 0, c: 0)
    @State private var trail: [Cell] = [Cell(r: 0, c: 0)]
    @State private var msg = "Tap Run"
    @State private var running = false
    
    let dirs: [String] = ["R","R","D","D","L","U","R"]
    let counts: [Int]  = [2, 1, 2, 1, 1, 1, 2]
    
    let walls: Set<Cell> = [
        Cell(r: 1, c: 4),
        Cell(r: 3, c: 2),
        Cell(r: 5, c: 5)
    ]
    
    var body: some View {
        VStack(spacing: 14) {
            Text("Robot Grid").font(.title2).bold()
            Text(msg).font(.callout)
            
            grid
            
            HStack(spacing: 12) {
                Button(running ? "Running..." : "Run") {
                    if !running {
                        reset(startR: 0, startC: 0)
                        Task { await runPlan(speed: 0.22) }
                    }
                }
                .disabled(running)
                
                Button("Reset") {
                    reset(startR: 0, startC: 0)
                    msg = "Tap Run"
                }
                .disabled(running)
            }
        }
        .padding()
    }
    
    var grid: some View {
        VStack(spacing: 2) {
            ForEach(0..<N, id: \.self) { r in
                HStack(spacing: 2) {
                    ForEach(0..<N, id: \.self) { c in
                        Rectangle()
                            .fill(color(at: Cell(r: r, c: c)))
                            .frame(width: 34, height: 34)
                    }
                }
            }
        }
        .padding(6)
        .background(Color.black.opacity(0.08))
        .cornerRadius(14)
    }
    
    func runPlan(speed: Double) async {
        running = true
        msg = "Running..."
        
        for i in 0..<dirs.count {
            let d = dirs[i]
            let steps = counts[i]
            let ok = await move(dir: d, steps: steps, speed: speed)
            if !ok { break }
        }
        
        if !running { return }
        msg = "Done at (\(bot.r), \(bot.c))"
        running = false
    }
    
    func move(dir: String, steps: Int, speed: Double) async -> Bool {
        if steps <= 0 { return true }
        
        for _ in 0..<steps {
            let next = nextCell(from: bot, dir: dir)
            
            if inside(next, size: N) {
                if !walls.contains(next) {
                    bot = next
                    save(current: bot)
                } else {
                    msg = "Hit wall at (\(next.r), \(next.c))"
                    running = false
                    return false
                }
            } else {
                msg = "Hit edge"
                running = false
                return false
            }
            
            await pause(seconds: speed)
        }
        return true
    }
    
    func nextCell(from p: Cell, dir: String) -> Cell {
        if dir == "U" { return Cell(r: p.r - 1, c: p.c) }
        if dir == "D" { return Cell(r: p.r + 1, c: p.c) }
        if dir == "L" { return Cell(r: p.r, c: p.c - 1) }
        return Cell(r: p.r, c: p.c + 1)
    }
    
    func inside(_ p: Cell, size: Int) -> Bool {
        p.r >= 0 && p.r < size && p.c >= 0 && p.c < size
    }
    
    func save(current: Cell) {
        if trail.last != current { trail.append(current) }
    }
    
    func reset(startR: Int, startC: Int) {
        bot = Cell(r: startR, c: startC)
        trail = [bot]
    }
    
    func color(at p: Cell) -> Color {
        if p == bot { return .blue }
        if walls.contains(p) { return .red }
        if trail.contains(p) { return .gray.opacity(0.35) }
        return .white
    }
    
    func pause(seconds: Double) async {
        try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
}
