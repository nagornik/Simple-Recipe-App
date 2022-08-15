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
            VStack {
                Text("Swipe left to add a Heart")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                List (model.recipesArray) { recipe in
                    NavigationLink {
                        RecipeDetailView(recipe: recipe)
                    } label: {
                        OneListItem(recipe: recipe)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            let index = model.recipesArray.firstIndex(where: {$0.id == recipe.id})
                            model.recipesArray[index!].featured.toggle()
                            model.recipesArray[index!].id = UUID()
                        } label: {
                            Image(systemName: "heart")
                                .foregroundColor(.white)
                        }
                        .tint(.red)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                
            }
            .navigationBarTitle(Text("Menu"))
        }
        
        
        
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
