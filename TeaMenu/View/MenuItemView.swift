import SwiftUI
import URLImage

struct BubbleTeaItemView: View {
    var bubbleTea: BubbleTea
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        HStack {
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
                    .frame(width: 100, height: 100)
            }
            
            VStack(alignment: .leading) {
                Text(bubbleTea.name)
                    .font(.title)
                Text(bubbleTea.description)
                    .foregroundColor(.gray)
                Text(String(format: "$%.2f", bubbleTea.price))
                    .font(.headline)
                Button(action: {
                    viewModel.addToCart(bubbleTea: bubbleTea, quantity: 1)
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

struct BubbleTeaItemView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleTeaItemView(bubbleTea: BubbleTea(id: 1, name: "Sample Tea", description: "A sample tea description.", price: 4.99, imageName: "sample_tea.png"))
            .environmentObject(AppViewModel())
    }
}
