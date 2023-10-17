import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                BubbleTeaMenuView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Menu")
            }
            .onAppear {
                viewModel.fetchMenuFromAPI()
            }
            
            NavigationView {
                WishlistView()
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Wishlist")
            }
            
            NavigationView {
                CartView()
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text("Cart")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppViewModel())
    }
}
