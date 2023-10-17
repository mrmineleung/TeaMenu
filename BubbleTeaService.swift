import Foundation

class BubbleTeaService {
    func getBubbleTeaMenu(completion: @escaping ([BubbleTea]?) -> Void) {
        if let url = URL(string: "https://demo0120369.mockable.io/bubble_tea_menu") {
            let task = URLSession.shared.dataTask(with: url){
                    data, response, error in
                    
                    let decoder = JSONDecoder()

                    if let data = data{
                        do{
                            let tasks = try decoder.decode([BubbleTea].self, from: data)
                            completion(tasks)
                        }catch{
                            print(error)
                        }
                    }
                }
                task.resume()
        } else {
            completion(nil)
        }
    }
}
