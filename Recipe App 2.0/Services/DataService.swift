//
//  DataService.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import Foundation

class DataService {
    
    static func getData() -> [Recipe] {
        
        if let path = Bundle.main.path(forResource: "recipes", ofType: "json") {
            
            let url = URL(fileURLWithPath: path)
            
            do {
                
                let rawData = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                let decodedData = try decoder.decode([Recipe].self, from: rawData)
                
                for r in decodedData {
                    r.id = UUID()
                }
                
                return decodedData
            
            } catch {}
            
        }
        
        return [Recipe]()
    }
    
}
