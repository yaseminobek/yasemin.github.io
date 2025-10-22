import SwiftUI

struct ContentView: View {
    @State var currentPlayer = "X"
    @State var cell1 = ""
    @State var cell2 = ""
    @State var cell3 = ""
    @State var cell4 = ""
    @State var cell5 = ""
    @State var cell6 = ""
    @State var cell7 = ""
    @State var cell8 = ""
    @State var cell9 = ""
    @State var gameOver = false
    @State var statusText = ""
    let cellSize: CGFloat = 110
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(statusText.isEmpty ? "Turn: \(currentPlayer)" : statusText)
                .font(.title3)
                .padding(.top, 8)
            
            
            HStack(spacing: 20) {
                square(text: $cell1)
                square(text: $cell2)
                square(text: $cell3)
            }
            HStack(spacing: 20) {
                square(text: $cell4)
                square(text: $cell5)
                square(text: $cell6)
            }
            HStack(spacing: 20) {
                square(text: $cell7)
                square(text: $cell8)
                square(text: $cell9)
            }
            
            Button("Restart") { resetBoard() }
                .padding(.top, 8)
        }
    }
    
    
    func square(text: Binding<String>) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: cellSize, height: cellSize)
            
            Text(text.wrappedValue)
                .font(.title2)
                .foregroundColor(.white)
        }
        .onTapGesture {
            if !gameOver && text.wrappedValue.isEmpty {
                text.wrappedValue = currentPlayer
                checkWinner()
                if !gameOver {
                    currentPlayer = (currentPlayer == "X") ? "O" : "X"
                }
            }
        }
    }
    
    
    func checkWinner() {
        
        if cell1 != "" && cell1 == cell2 && cell2 == cell3 { statusText = "\(cell1) wins!"; gameOver = true }
        else if cell4 != "" && cell4 == cell5 && cell5 == cell6 { statusText = "\(cell4) wins!"; gameOver = true }
        else if cell7 != "" && cell7 == cell8 && cell8 == cell9 { statusText = "\(cell7) wins!"; gameOver = true }
        else if cell1 != "" && cell1 == cell4 && cell4 == cell7 { statusText = "\(cell1) wins!"; gameOver = true }
        else if cell2 != "" && cell2 == cell5 && cell5 == cell8 { statusText = "\(cell2) wins!"; gameOver = true }
        else if cell3 != "" && cell3 == cell6 && cell6 == cell9 { statusText = "\(cell3) wins!"; gameOver = true }
        else if cell1 != "" && cell1 == cell5 && cell5 == cell9 { statusText = "\(cell1) wins!"; gameOver = true }
        else if cell3 != "" && cell3 == cell5 && cell5 == cell7 { statusText = "\(cell3) wins!"; gameOver = true }
        else if [cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9].allSatisfy({ !$0.isEmpty }) {
            statusText = "Draw!"
            gameOver = true
        }
    }
    
    
    func resetBoard() {
        cell1 = ""; cell2 = ""; cell3 = ""
        cell4 = ""; cell5 = ""; cell6 = ""
        cell7 = ""; cell8 = ""; cell9 = ""
        currentPlayer = "X"
        statusText = ""
        gameOver = false
    }
}   
