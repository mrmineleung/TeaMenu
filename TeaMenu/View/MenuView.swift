import SwiftUI

struct BubbleTeaMenuView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationView {
            List(viewModel.bubbleTeaMenu) { bubbleTea in
                NavigationLink(destination: BubbleTeaDetail(bubbleTea: bubbleTea)) {
                    BubbleTeaItemView(bubbleTea: bubbleTea)
                }
            }
        }
    }
}

struct BubbleTeaMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleTeaMenuView()
            .environmentObject(AppViewModel())
    }
}
