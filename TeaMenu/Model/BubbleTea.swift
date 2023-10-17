import Foundation

struct BubbleTea: Identifiable, Decodable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var imageName: String // Name of the image file
}

