//
//  DataService.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        if let path = Bundle.main.path(forResource: "recipes", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            do {
                let rawData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Recipe].self, from: rawData)
//                for r in decodedData {
//                    r.id = UUID()
//                }
                return decodedData
            } catch {}
        }
        return [Recipe]()
    }
    
    static func getDataFromJsonFromGithub() async -> [Recipe] {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/nagornik/Simple-Recipe-App/main/recipes.json") else { return [Recipe]() }
        let urlRequest = URLRequest(url: url)
        let (data, responce) = try! await URLSession.shared.data(for: urlRequest)
        
        guard let responce = responce as? HTTPURLResponse else { return [Recipe]() }
        guard responce.statusCode >= 200 && responce.statusCode < 300 else { return [Recipe]() }
        
        let decodedData = try! JSONDecoder().decode([Recipe].self, from: data)
        
//        for recipe in decodedData {
//            recipe.id = UUID()
//        }
        
        return decodedData
        
    }
    
}
