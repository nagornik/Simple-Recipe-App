//
//  ContentView.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        
        
        NavigationView {
            List (model.recipesArray) { recipe in
                
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    OneListItem(recipe: recipe)
                }

                
                
                
            }.navigationBarTitle(Text("Menu"))
        }
        
        
        
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
