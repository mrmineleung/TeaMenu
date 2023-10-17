import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cart) { cartItem in
                    HStack {
                        Text(cartItem.bubbleTea.name)
                        Spacer()
                        Stepper(value: $viewModel.cart[viewModel.cart.firstIndex(where: { $0.id == cartItem.id })!].quantity, in: 1...10) {
                            Text("Quantity: \(cartItem.quantity)")
                        }
                    }
                }
            }
        }
    }
}
