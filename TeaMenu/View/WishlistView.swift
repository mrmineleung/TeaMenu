import SwiftUI

struct WishlistView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.wishlist) { wishlistItem in
                HStack {
                    Text(wishlistItem.bubbleTea.name)
                    Spacer()
                    Button(action: {
                        // Implement the delete action
                        viewModel.removeFromWishlist(item: wishlistItem)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}
