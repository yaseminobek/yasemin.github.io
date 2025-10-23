import SwiftUI 
struct ContentView: View {
    var body: some View {
        ZStack { // Stack views; back to front layering
            Color.black.ignoresSafeArea() // Full screen black background
            VStack(spacing: 28) { // Vertical layout for title + letters
                Text("My Initials with Code")
                    .font(.system(size: 36, weight: .bold)) // Large bold title
                    .foregroundColor(.white) // White text color
                HStack(spacing: 36) { // Place the three letters side by side
                    LetterGrid(letter: .y, onColor: .pink) // Y in pink
                    LetterGrid(letter: .d, onColor: .purple) // D in purple
                    LetterGrid(letter: .o, onColor: .teal) // O in teal
                }
            }
            .padding(24) // Outer padding around content
        }
    }
}

enum LetterKind { case y, d, o } // Supported letter types

struct LetterGrid: View {
    let letter: LetterKind // Which letter to draw
    let onColor: Color // Color for "on" dots
    let gridSize = 10 // 10x10 grid
    let dotSize: CGFloat = 18 // Diameter of each dot
    let gap: CGFloat = 6 // Spacing between dots
    
    func isOn(_ r: Int, _ c: Int) -> Bool { 
        switch letter {
        case .o:
            return r == 0 || r == 9 || c == 0 || c == 9 // Border of the grid forms an O
        case .d:
            return c == 0
            || ((r == 0 || r == 9) && c <= 8) // Top/bottom horizontal strokes
            || (c == 9 && r >= 1 && r <= 8) // Right vertical to round the D
        case .y:
            return (r < 5 && (c == r || c == 9 - r)) // Upper V shape
            || (r >= 4 && c == 5) 
        }
    }
    
    var body: some View {
        VStack(spacing: gap) { // Rows of the grid
            ForEach(0..<gridSize, id: \.self) { r in // Iterate rows
                HStack(spacing: gap) { // Columns in each row
                    ForEach(0..<gridSize, id: \.self) { c in // Iterate columns
                        Circle()
                            .frame(width: dotSize, height: dotSize) // Dot size
                            .foregroundStyle(isOn(r, c) ? onColor : .clear) // Lit or transparent
                    }
                }
            }
        }
        .padding(8) // Inner padding around the grid
    }
}
