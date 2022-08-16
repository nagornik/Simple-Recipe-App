//
//  Recipe.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import Foundation

class Recipe: Identifiable, Decodable {

    var id: UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var highlights:[String]
    var directions:[String]
    
}
