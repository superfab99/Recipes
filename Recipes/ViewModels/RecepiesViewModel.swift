//
//  RecepiesViewModel.swift
//  Recepies
//
//  Created by Suyog Sawant on 04/07/22.
//

import Foundation
class RecepiesViewModel: ObservableObject{
    @Published var recepies : [Recipes] = []
    @Published var recepieById : Recipes?
    
    var apiKey = "" //get api key from spoonacular.com
    var totalPages = 10
    var page : Int = 1
    
    func getRecepies(){
        guard let url = URL(string: "https://api.spoonacular.com/recipes/random?limitLicense=true&number=10&apiKey=\(apiKey)")else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(Welcome.self, from: data) {
                    DispatchQueue.main.async {
                        self.recepies.append(contentsOf: response.recipes)
                    }
                }
                else{
                    print(error)
                }
            }
        }.resume()
    }
    
    func getRecepieById(id: Int,completion:@escaping (Recipes) -> ()){
        guard let url = URL(string: "https://api.spoonacular.com/recipes/\(id)/information?includeNutrition=false&apiKey=\(apiKey)")else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(Recipes.self, from: data) {
                    print(response)
                    DispatchQueue.main.async {
                        completion(response)
                    }
                }
                else{
                    print(error)
                }
            }
        }.resume()
    }
    
    func loadMoreRecepies(currentItem item: Recipes){
        let currentIndex = recepies.firstIndex(where: {$0.id == item.id})
        let thresholdIndex = self.recepies.index(self.recepies.endIndex, offsetBy: -1)
        if thresholdIndex == currentIndex, (page + 1) <= totalPages {
            page += 1
            getRecepies()
        }
    }
}
