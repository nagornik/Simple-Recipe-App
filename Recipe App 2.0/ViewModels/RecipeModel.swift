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
    
    init() {
//        recipesArray = DataService.getLocalData()
    }
    
}
