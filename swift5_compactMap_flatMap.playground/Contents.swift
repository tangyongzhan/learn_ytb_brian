import UIKit

// https://www.youtube.com/watch?v=EUtTU4lW2QI
// https://learnappmaking.com/swift-flatmap-compactmap-how-to/


// compactMap 和 flatMap的使用
struct Store {
    var name: String
    var products: [String]?
}

var appleStore = Store(name: "apple", products: ["iphone","ipad","mackbook","iMac"])
var foodsStore = Store(name: "7-11", products: ["milk","bread","egg"])
var empytStore = Store(name: "nothing", products: nil)

//var allProducts1 = appleStore.products + foodsStore.products + empytStore.products
//print(allProducts1)

var allProducts2 = [appleStore, foodsStore, empytStore].compactMap({$0.products}).flatMap({$0})
print(allProducts2)




