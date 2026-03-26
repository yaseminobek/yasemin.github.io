import SwiftUI

struct FocusCard: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let color: Color
    let points: [String]
}

struct ContentView: View {
    
    let focusCards: [FocusCard] = [
        FocusCard(
            title: "Work Time",
            imageName: "books.vertical.fill",
            color: Color.blue.opacity(0.85),
            points: ["45 min deep focus", "No phone", "Finish one task"]
        ),
        FocusCard(
            title: "Brain Break",
            imageName: "brain.head.profile",
            color: Color.pink.opacity(0.75),
            points: ["10 min walk", "Stretch", "Drink water"]
        ),
        FocusCard(
            title: "Daily Sport",
            imageName: "basketball.fill",
            color: Color.orange.opacity(0.7),
            points: ["20 min movement", "Any sport you like", "Track streak"]
        ),
        FocusCard(
            title: "Eating Time",
            imageName: "fork.knife",
            color: Color.yellow.opacity(0.45),
            points: ["Balanced meal", "No screens", "Eat slowly"]
        )
    ]
    
    @State private var selectedCardID: UUID? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.white, Color.blue.opacity(0.25)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 25) {
                    
                    VStack(spacing: 10) {
                        Text("Your smart guide for productive studying")
                            .font(.title3)
                            .foregroundColor(.gray)
                        
                        Text("Daily Focuses")
                            .font(.system(size: 48, weight: .bold))
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 250, height: 3)
                    }
                    .padding(.top, 30)
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 20) {
                        
                        ForEach(focusCards) { card in
                            FocusCardView(
                                card: card,
                                isOpen: selectedCardID == card.id,
                                onTap: {
                                    if selectedCardID == card.id {
                                        selectedCardID = nil
                                    } else {
                                        selectedCardID = card.id
                                    }
                                }
                            )
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

struct FocusCardView: View {
    let card: FocusCard
    let isOpen: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 35)
                    .fill(card.color)
                    .frame(height: isOpen ? 200 : 140)
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 5)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(card.title)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: card.imageName)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    if isOpen {
                        VStack(alignment: .leading, spacing: 6) {
                            ForEach(card.points, id: \.self) { point in
                                Text("• \(point)")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                            }
                        }
                        .padding(.top, 5)
                    }
                }
                .padding()
            }
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.easeInOut, value: isOpen)
    }
}
