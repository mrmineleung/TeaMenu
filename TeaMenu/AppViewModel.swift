import Foundation
import Combine

class AppViewModel: ObservableObject {
    @Published var wishlist: [WishlistItem] = []
    @Published var cart: [CartItem] = []
    @Published var bubbleTeaMenu: [BubbleTea] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    let apiUrl = "https://demo0120369.mockable.io/bubble_tea_menu"
    
    func isInWishlist(item: BubbleTea) -> Bool {
        return wishlist.contains { $0.bubbleTea.id == item.id }
    }
    
    func addToWishlist(bubbleTea: BubbleTea) {
        if !isInWishlist(item: bubbleTea) {
            wishlist.append(WishlistItem(bubbleTea: bubbleTea))
        }
    }
    
    func removeFromWishlist(item: WishlistItem) {
        if let index = wishlist.firstIndex(where: { $0.id == item.id }) {
            wishlist.remove(at: index)
        }
    }
    
    // Function to add an item to the cart with a specific quantity
    func addToCart(bubbleTea: BubbleTea, quantity: Int) {
        if let index = cart.firstIndex(where: { $0.bubbleTea.id == bubbleTea.id }) {
            cart[index].quantity += quantity
        } else {
            cart.append(CartItem(bubbleTea: bubbleTea, quantity: quantity))
        }
    }
    
    // Function to remove an item from the cart
    func removeFromCart(item: CartItem) {
        if let index = cart.firstIndex(where: { $0.id == item.id }) {
            cart.remove(at: index)
        }
    }
    
    // Function to update the quantity of an item in the cart
    func updateCartItemQuantity(item: CartItem, quantity: Int) {
        if let index = cart.firstIndex(where: { $0.id == item.id }) {
            cart[index].quantity = quantity
        }
    }
    
    // Function to fetch the menu from the API
    func fetchMenuFromAPI() {
        
        guard let url = URL(string: apiUrl) else {
            print("Invalid API URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [BubbleTea].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Ensure updates are on the main thread
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("API request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] data in
                self?.bubbleTeaMenu = data
            })
            .store(in: &cancellables)
    }
    
    
}
