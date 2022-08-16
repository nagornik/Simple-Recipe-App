//
//  RecipeModel.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import Foundation
import Combine

class RecipeModel: ObservableObject {
    
    @Published var recipesArray = [Recipe]()
    
    func markFeatured(recipe: Recipe) {
        if let index = recipesArray.firstIndex(where: {$0.id == recipe.id}) {
            recipesArray[index].featured.toggle()
        }
        recipesArray.sort(by: {$0.name < $1.name})
    }
    
    
    // MARK: Assign data from local file
    
//    init() {
//        recipesArray = DataService.getLocalData()
//    }
    
}
