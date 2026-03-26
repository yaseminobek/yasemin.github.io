import SwiftUI

struct Recipe {
    var name: String
    var steps: [String]
}

struct ContentView: View {
    
    // LIST (COLLECTION):
    // This array stores multiple Recipe objects.
    // A list/collection is used to keep all recipes in one place.
    var recipes: [Recipe] = [
        Recipe(name: "Burger", steps: ["Bun", "Patty", "Cheese"]),
        Recipe(name: "Pizza", steps: ["Dough", "Sauce", "Cheese"]),
        Recipe(name: "Salad", steps: ["Lettuce", "Tomato", "Dressing"])
    ]
    
    @State private var currentRecipe: Recipe?
    @State private var currentRecipeSteps: [String] = []
    
    // LIST (COLLECTION):
    // This array stores the ingredients chosen by the player.
    @State private var playerSelection: [String] = []
    
    @State private var money: Int = 0
    @State private var reputation: Int = 100
    @State private var screen: String = "Home"
    @State private var resultMessage: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 0.95, green: 0.88, blue: 0.76)
                .ignoresSafeArea()
            
            // SELECTION:
            // The program checks the value of "screen"
            // and decides which screen to show.
            if screen == "Home" {
                homeScreen
            } else if screen == "Game" {
                gameScreen
            } else if screen == "Result" {
                resultScreen
            }
        }
    }
    
    var homeScreen: some View {
        VStack(spacing: 20) {
            Spacer()
            
            VStack(spacing: 15) {
                Text("Kitchen Rush")
                    .font(.largeTitle)
                    .bold()
                
                Text("Make orders correctly to earn money!")
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("How to Play:")
                        .bold()
                    Text("1. Read the recipe")
                    Text("2. Click ingredients in order")
                    Text("3. Submit your order")
                    Text("4. Correct = +$10, Wrong = -10 reputation")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                Button(action: {
                    StartNewRound()
                    screen = "Game"
                }) {
                    Text("Start Game")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding()
            
            Spacer()
        }
    }
    
    var gameScreen: some View {
        VStack(spacing: 15) {
            
            HStack {
                VStack {
                    Text("Money")
                    Text("$\(money)")
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                VStack {
                    Text("Reputation")
                    Text("\(reputation)%")
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Order: \(currentRecipe?.name ?? "")")
                    .bold()
                
                Text("Recipe:")
                    .bold()
                
                // ITERATION:
                // This loop goes through each step in the recipe
                // and displays it on the screen.
                ForEach(currentRecipeSteps.indices, id: \.self) { i in
                    Text("\(i + 1). \(currentRecipeSteps[i])")
                }
                
                Text("Your Selection:")
                    .bold()
                
                Text(playerSelection.joined(separator: ", "))
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            
            // LIST (COLLECTION):
            // This creates a list of all possible ingredients
            // from every recipe.
            let allIngredients = Array(Set(recipes.flatMap { $0.steps }))
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
                
                // ITERATION:
                // This loop creates one button for each ingredient.
                ForEach(allIngredients, id: \.self) { ingredient in
                    Button(action: {
                        AddIngredient(ingredientName: ingredient)
                    }) {
                        Text(ingredient)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            
            HStack {
                Button("Clear") {
                    playerSelection = []
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                
                Button("Submit") {
                    let isCorrect = CheckOrder(recipeSteps: currentRecipeSteps,
                                               selection: playerSelection)
                    
                    // SELECTION:
                    // If the order is correct, the player earns money.
                    // Otherwise, the player loses reputation.
                    if isCorrect {
                        money += 10
                        resultMessage = "Correct! +$10"
                    } else {
                        reputation -= 10
                        resultMessage = "Wrong order! -10 reputation"
                    }
                    
                    screen = "Result"
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
    
    var resultScreen: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text(resultMessage)
                .font(.title)
                .bold()
            
            Text("Money: $\(money)")
            Text("Reputation: \(reputation)%")
            
            Button("Play Again") {
                
                // SELECTION:
                // If reputation is 0 or below, the game ends.
                // Otherwise, a new round starts.
                if reputation <= 0 {
                    resultMessage = "Game Over"
                } else {
                    StartNewRound()
                    screen = "Game"
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("End") {
                screen = "Home"
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
    
    // PROCEDURE (FUNCTION WITH PARAMETER):
    // This function starts a new round by clearing the player's choices
    // and choosing a random recipe from the recipes list.
    func StartNewRound() {
        playerSelection = []
        if let randomRecipe = recipes.randomElement() {
            currentRecipe = randomRecipe
            currentRecipeSteps = randomRecipe.steps
        }
    }
    
    // PROCEDURE (FUNCTION WITH PARAMETER):
    // Parameter: ingredientName
    // This function adds the tapped ingredient to the player's selection list.
    func AddIngredient(ingredientName: String) {
        playerSelection.append(ingredientName)
    }
    
    // PROCEDURE (FUNCTION WITH PARAMETERS):
    // Parameters: recipeSteps, selection
    // This function checks whether the player's order matches the correct recipe.
    func CheckOrder(recipeSteps: [String], selection: [String]) -> Bool {
        
        // ALGORITHM:
        // Sequence:
        // 1. Check if the lengths are equal.
        // 2. Compare each ingredient one by one.
        // 3. Return true if all ingredients match.
        
        // SELECTION:
        if selection.count != recipeSteps.count {
            return false
        }
        
        // ITERATION:
        for i in 0..<recipeSteps.count {
            
            // SELECTION:
            if selection[i] != recipeSteps[i] {
                return false
            }
        }
        
        return true
    }
}
