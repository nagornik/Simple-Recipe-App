//
//  DataService.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import Foundation
import SwiftUI

class DataService {
    
    @EnvironmentObject var model: RecipeModel
    
    // MARK: - Get data JSON on GitHub
    
    static func getDataFromJsonFromGithub() async -> [Recipe] {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/nagornik/Simple-Recipe-App/main/recipes.json") else { return [Recipe]() }
        let urlRequest = URLRequest(url: url)
        let (data, responce) = try! await URLSession.shared.data(for: urlRequest)
        
        guard let responce = responce as? HTTPURLResponse else { return [Recipe]() }
        guard responce.statusCode >= 200 && responce.statusCode < 300 else { return [Recipe]() }
        
        do {
            let decodedData = try JSONDecoder().decode([Recipe].self, from: data)
            for recipe in decodedData {
                recipe.id = UUID()
                recipe.image = "https://raw.githubusercontent.com/nagornik/Simple-Recipe-App/main/img/\(recipe.image.replacingOccurrences(of: " ", with: "-")).jpg"
            }
            
            return decodedData
            
        } catch {
            print("Can't decode data:" + error.localizedDescription)
        }
        
        return [Recipe]()
        
    }
    
    // MARK: - Get data from local JSON
    
    //    static func getLocalData() -> [Recipe] {
    //        if let path = Bundle.main.path(forResource: "recipes", ofType: "json") {
    //            let url = URL(fileURLWithPath: path)
    //            do {
    //                let rawData = try Data(contentsOf: url)
    //                let decoder = JSONDecoder()
    //                let decodedData = try decoder.decode([Recipe].self, from: rawData)
    //                for r in decodedData {
    //                    r.id = UUID()
    //                }
    //                return decodedData
    //            } catch {}
    //        }
    //        return [Recipe]()
    //    }
    
    
    // MARK: - Cache images
    
    static var imageCache = [String : Image]()
    
    static func getImage(forKey: String) -> Image? {
        return imageCache[forKey]
    }
    
    static func setImage(image: Image, forKey: String) {
        imageCache[forKey] = image
    }
    
}
