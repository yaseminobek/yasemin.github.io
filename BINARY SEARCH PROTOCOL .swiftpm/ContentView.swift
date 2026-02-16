import Foundation

let database = [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
let targetID = 23

var low = 0
var high = database.count - 1
var steps = 0
var found = false
var foundIndex = -1

print("> SYSTEM: Starting Binary Search Protocol...")
print("> Target ID: \(targetID)")
print("> ----------------------------------------")

while low <= high && !found {
    steps += 1
    let mid = (low + high) / 2
    let value = database[mid]
    
    print("> Step \(steps): Checking Index [\(mid)] -> Value: \(value)")
    
    if value == targetID {
        found = true
        foundIndex = mid
    } else if value < targetID {
        low = mid + 1
    } else {
        high = mid - 1
    }
}

print(">")

if found {
    print("> SUCCESS: User ID found at Index \(foundIndex)")
    print("> EFFICIENCY: Operation completed in \(steps) steps.")
}

