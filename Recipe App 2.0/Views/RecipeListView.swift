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
                Text("Swipe left to Like or Dislike")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                List {
                    ForEach(model.recipesArray) { recipe in
                        
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            OneListItem(recipe: recipe)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                model.markFeatured(recipe: recipe)
                            } label: {
                                Image(systemName: "heart")
                                    .foregroundColor(.white)
                            }
                            .tint(.red)
                        }
                        .listRowBackground(Color("back"))
                        
                    }
                }
                .listStyle(.plain)
                .listRowBackground(Color("back"))
                .refreshable {
                    model.recipesArray.sort(by: {$0.name < $1.name})
                }
                
            }
            .background(Color("back"))
            .navigationBarTitle(Text("Menu"))
            
        }
        
        
        
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeListView()
            .environmentObject(model)
            .task {
                model.recipesArray = await DataService.getDataFromJsonFromGithub()
            }
    }
}
