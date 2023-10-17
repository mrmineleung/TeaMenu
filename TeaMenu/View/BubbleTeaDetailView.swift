import SwiftUI
import URLImage

struct BubbleTeaDetail: View {
    @EnvironmentObject var viewModel: AppViewModel
    let bubbleTea: BubbleTea
    
    @State private var quantity: Int = 1
    
    
    var body: some View {
        VStack {
            URLImage(URL(string: bubbleTea.imageName)!) {
                // This view is displayed before download starts
                EmptyView()
            } inProgress: { progress in
                // Display progress
                Text("Loading...")
            } failure: { error, retry in
                // Display error and retry button
                VStack {
                    Text("No Image")
                }
            } content: { image in
                // Downloaded image
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            Text(bubbleTea.name)
                .font(.title)
            
            Text(bubbleTea.description)
                .padding()
            
            Text("Price: $\(bubbleTea.price, specifier: "%.2f")")
            
            
            if !viewModel.isInWishlist(item: bubbleTea) {
                Button(action: {
                    // Add to wishlist
                    viewModel.addToWishlist(bubbleTea: bubbleTea)
                }) {
                    Text("Add to Wishlist")
                }
            } else {
                Text("Already in Wishlist")
                    .foregroundColor(.gray)
            }
            
            Stepper(value: $quantity, in: 1...10, label: {
                Text("Quantity: \(quantity)")
            })
            
            Button(action: {
                // Add to cart
                viewModel.addToCart(bubbleTea: bubbleTea, quantity: quantity)
            }) {
                Text("Add to Cart")
            }
        }
        .navigationBarTitle(bubbleTea.name, displayMode: .inline)
    }
}
