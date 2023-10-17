import Foundation

struct CartItem: Identifiable {
    var id = UUID()
    var bubbleTea: BubbleTea
    var quantity: Int
}
