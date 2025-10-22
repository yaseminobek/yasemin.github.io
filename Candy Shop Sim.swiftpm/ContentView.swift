import SwiftUI

func runCandyShopSimulation() -> String {
    var chocolateStock = 8
    var gummyStock = 10
    var lollipopStock = 9
    var caramelStock = 8
    
    var chocolatePrice = 3
    var gummyPrice = 2
    var lollipopPrice = 2
    var caramelPrice = 3
    
    var soldChocolate = 0
    var soldGummy = 0
    var soldLollipop = 0
    var soldCaramel = 0
    var cash = 0
    
    func totalStock() -> Int { chocolateStock + gummyStock + lollipopStock + caramelStock }
    
    func bestSeller() -> String {
        let pairs: [(String, Int)] = [
            ("Chocolate", soldChocolate),
            ("Gummy", soldGummy),
            ("Lollipop", soldLollipop),
            ("Caramel", soldCaramel)
        ]
        return pairs.max(by: { $0.1 < $1.1 })?.0 ?? "None"
    }
    
    func lowStockWarnings() -> [String] {
        var lows = [String]()
        if chocolateStock <= 2 { lows.append("Chocolate") }
        if gummyStock <= 2 { lows.append("Gummy") }
        if lollipopStock <= 2 { lows.append("Lollipop") }
        if caramelStock <= 2 { lows.append("Caramel") }
        return lows
    }
    
    let enableDiscountEvery15 = false
    let enableRestockEvery20 = true
    var blockLog = ""
    var out = ""
    
    func sellCaramel() {
        if caramelStock > 0 {
            caramelStock -= 1
            soldCaramel += 1
            cash += caramelPrice
            blockLog += "R"
        }
    }
    
    func sellGummy() {
        if gummyStock > 0 {
            gummyStock -= 1
            soldGummy += 1
            cash += gummyPrice
            blockLog += "G"
        }
    }
    
    func sellLollipop() {
        if lollipopStock > 0 {
            lollipopStock -= 1
            soldLollipop += 1
            cash += lollipopPrice
            blockLog += "L"
        }
    }
    
    func sellChocolate() {
        if chocolateStock > 0 {
            chocolateStock -= 1
            soldChocolate += 1
            cash += chocolatePrice
            blockLog += "C"
        } else {
            sellCaramel()
        }
    }
    
    for minute in 1...60 {
        if enableRestockEvery20 && minute % 20 == 0 {
            chocolateStock += 2
            gummyStock += 2
            lollipopStock += 2
            caramelStock += 2
            out += "📦 Restock event at minute \(minute) (+2 each)\n"
        }
        
        if minute % 5 == 0 {
            if enableDiscountEvery15 && minute % 15 == 0 { chocolatePrice = max(0, chocolatePrice - 1) }
            sellChocolate()
            if enableDiscountEvery15 && minute % 15 == 0 { chocolatePrice += 1 }
        } else if minute % 2 == 0 {
            if enableDiscountEvery15 && minute % 15 == 0 { gummyPrice = max(0, gummyPrice - 1) }
            sellGummy()
            if enableDiscountEvery15 && minute % 15 == 0 { gummyPrice += 1 }
        } else if minute % 3 == 0 {
            if enableDiscountEvery15 && minute % 15 == 0 { lollipopPrice = max(0, lollipopPrice - 1) }
            sellLollipop()
            if enableDiscountEvery15 && minute % 15 == 0 { lollipopPrice += 1 }
        } else {
            blockLog += "."
        }
        
        if minute % 10 == 0 {
            out += "\nMinute \(minute): 🧾 Sales Update\n"
            out += blockLog + "\n"
            blockLog = ""
            let left = totalStock()
            if left <= 10 {
                out += "⚠️  Restock Needed — total left: \(left)\n"
            }
        }
    }
    
    for n in (1...5).reversed() { out += "Closing in \(n)...\n" }
    
    out += "\n🧾 FINAL REPORT\n"
    out += "💰 Cash: $\(cash)\n"
    out += "Sold — Choc:\(soldChocolate) Gummy:\(soldGummy) Lolli:\(soldLollipop) Car:\(soldCaramel)\n"
    out += "Left — Choc:\(chocolateStock) Gummy:\(gummyStock) Lolli:\(lollipopStock) Car:\(caramelStock)\n"
    let lows = lowStockWarnings()
    if lows.isEmpty {
        out += "Warnings:\n(none)\n"
    } else {
        out += "Warnings:\n"
        for item in lows { out += "LOW: \(item)\n" }
    }
    out += "🏆 Best Seller: \(bestSeller())\n"
    return out
}

struct ContentView: View {
    @State private var log = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Candy Shop Simulation")
            HStack {
                Button("Run Simulation") { log = runCandyShopSimulation() }
                Button("Clear") { log = "" }
            }
            ScrollView {
                Text(log)
                    .font(.system(.body, design: .monospaced))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 8)
            }
        }
        .padding()
    }
}

