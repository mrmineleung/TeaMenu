import SwiftUI

struct MenuOptionView: View {
    var iconName: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(25)
                .padding(.trailing, 10)
            
            Text(title)
                .font(.headline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct MenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionView(iconName: "list.bullet", title: "Menu")
    }
}
