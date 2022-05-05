//
//  ContentView.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        List (model.recipesArray) { recipe in
            
            HStack {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
                    .padding(5)
                    
                VStack (alignment: .leading) {
                    Text(recipe.name)
                        .font(.title3)
                        .fontWeight(.medium)
                    Text(recipe.totalTime)
                        .font(.subheadline)
                        .fontWeight(.light)
                        
                }
                
            }
            
        }
        
        
        
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
