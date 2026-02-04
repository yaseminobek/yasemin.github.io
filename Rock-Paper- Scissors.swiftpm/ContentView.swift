import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup { MainTabView() }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            RockPaperScissorsView()
                .tabItem { Label("RPS", systemImage: "hand.raised.fill") }
            
            PatternGeneratorView()
                .tabItem { Label("Pattern", systemImage: "square.grid.3x3.fill") }
        }
    }
}

enum Choice: String, CaseIterable, Identifiable {
    case rock = "🪨", paper = "📄", scissors = "✂️"
    var id: String { rawValue }
}

enum RoundResult {
    case win, loss, tie
    var text: String {
        switch self {
        case .win: return "You win!"
        case .loss: return "You lose!"
        case .tie: return "It's a tie!"
        }
    }
}

struct Round: Identifiable {
    let id = UUID()
    let player: Choice
    let computer: Choice
    let result: RoundResult
}

struct RockPaperScissorsView: View {
    @State private var player: Choice?
    @State private var computer: Choice?
    @State private var message = "Make a choice!"
    @State private var wins = 0
    @State private var losses = 0
    @State private var ties = 0
    @State private var history: [Round] = []
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Rock • Paper • Scissors").font(.title).bold()
            Text("You: \(player?.rawValue ?? "—")   Computer: \(computer?.rawValue ?? "—")").font(.title2)
            Text(message).font(.headline)
            
            HStack(spacing: 12) {
                ForEach(Choice.allCases) { c in
                    Button {
                        play(c)
                    } label: {
                        Text(c.rawValue)
                            .font(.system(size: 44))
                            .padding()
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(14)
                    }
                }
            }
            
            Text("Wins: \(wins)   Losses: \(losses)   Ties: \(ties)").font(.headline)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Last 5 Games").font(.headline)
                if history.isEmpty {
                    Text("No games yet.").foregroundColor(.secondary)
                } else {
                    ForEach(history) { r in
                        Text("You \(r.player.rawValue) vs \(r.computer.rawValue) → \(r.result.text)")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.08))
            .cornerRadius(14)
            
            Button("Restart Game", role: .destructive) {
                restart()
            }
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red.opacity(0.15))
            .cornerRadius(14)
            
            Spacer()
        }
        .padding()
    }
    
    private func play(_ choice: Choice) {
        let comp = Choice.allCases.randomElement() ?? .rock
        let result = winner(player: choice, computer: comp)
        
        player = choice
        computer = comp
        message = result.text
        
        switch result {
        case .win: wins += 1
        case .loss: losses += 1
        case .tie: ties += 1
        }
        
        history.insert(Round(player: choice, computer: comp, result: result), at: 0)
        if history.count > 5 { history.removeLast() }
    }
    
    private func winner(player: Choice, computer: Choice) -> RoundResult {
        if player == computer { return .tie }
        if (player == .rock && computer == .scissors) ||
            (player == .paper && computer == .rock) ||
            (player == .scissors && computer == .paper) { return .win }
        return .loss
    }
    
    private func restart() {
        player = nil
        computer = nil
        message = "Make a choice!"
        wins = 0
        losses = 0
        ties = 0
        history = []
    }
}

struct PatternGeneratorView: View {
    @State private var size = 4
    @State private var grid: [[Color]] = Array(repeating: Array(repeating: .white, count: 4), count: 4)
    @State private var paint = Color.blue
    @State private var anim = true
    
    let key = "grid_save_v1"
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Pattern Generator").font(.title).bold()
            
            Picker("Grid", selection: $size) {
                Text("4x4").tag(4)
                Text("6x6").tag(6)
            }
            .pickerStyle(.segmented)
            .onChange(of: size) { _, v in
                grid = Array(repeating: Array(repeating: .white, count: v), count: v)
            }
            
            HStack(spacing: 12) {
                ColorPicker("Color", selection: $paint)
                Toggle("Anim", isOn: $anim)
            }
            
            VStack(spacing: 6) {
                ForEach(0..<size, id: \.self) { r in
                    HStack(spacing: 6) {
                        ForEach(0..<size, id: \.self) { c in
                            Rectangle()
                                .fill(grid[r][c])
                                .frame(width: cell(), height: cell())
                                .cornerRadius(8)
                                .onTapGesture {
                                    if anim { withAnimation { grid[r][c] = paint } }
                                    else { grid[r][c] = paint }
                                }
                        }
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.08))
            .cornerRadius(16)
            
            HStack(spacing: 12) {
                Button("Randomize") {
                    if anim { withAnimation { randomize() } } else { randomize() }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Clear") {
                    if anim { withAnimation { clear() } } else { clear() }
                }
                .buttonStyle(.bordered)
                
                Button("Save") { save() }.buttonStyle(.bordered)
                Button("Load") { load() }.buttonStyle(.bordered)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            grid = Array(repeating: Array(repeating: .white, count: size), count: size)
        }
    }
    
    private func cell() -> CGFloat { size == 4 ? 70 : 45 }
    
    private func randomize() {
        let palette: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .teal, .indigo, .brown]
        grid = (0..<size).map { _ in (0..<size).map { _ in palette.randomElement() ?? .blue } }
    }
    
    private func clear() {
        for r in 0..<size { for c in 0..<size { grid[r][c] = .white } }
    }
    
    private func save() {
        let flat = grid.flatMap { $0.map { $0.rgba() } }
        UserDefaults.standard.set(flat, forKey: key)
        UserDefaults.standard.set(size, forKey: key + "_size")
    }
    
    private func load() {
        let s = UserDefaults.standard.integer(forKey: key + "_size")
        let loadedSize = (s == 4 || s == 6) ? s : size
        let arr = UserDefaults.standard.stringArray(forKey: key) ?? []
        
        size = loadedSize
        grid = Array(repeating: Array(repeating: .white, count: loadedSize), count: loadedSize)
        if arr.count != loadedSize * loadedSize { return }
        
        var i = 0
        for r in 0..<loadedSize {
            for c in 0..<loadedSize {
                grid[r][c] = Color.fromRGBA(arr[i]) ?? .white
                i += 1
            }
        }
    }
}

extension Color {
    func rgba() -> String {
        let ui = UIColor(self)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        ui.getRed(&r, green: &g, blue: &b, alpha: &a)
        return "\(r),\(g),\(b),\(a)"
    }
    
    static func fromRGBA(_ s: String) -> Color? {
        let p = s.split(separator: ",").compactMap { Double($0) }
        if p.count != 4 { return nil }
        return Color(.sRGB, red: p[0], green: p[1], blue: p[2], opacity: p[3])
    }
}
