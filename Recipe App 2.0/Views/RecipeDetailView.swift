//
//  RecipeDetailView.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            
            
            Image(recipe.image)
                .resizable()
                .scaledToFit()
             
            VStack (alignment: .leading) {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .font(Font.custom("Avenir Black", size: 26))
                            .padding(.top)
                        Text(recipe.description)
                            .font(Font.custom("Avenir", size: 16))
                    }
                    
                    Spacer()
                    
                    Image(systemName: recipe.featured ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .font(.system(size: 36))
                        .onTapGesture {
                            recipe.featured.toggle()
                        }
                        .onDisappear {
                            if let index = model.recipesArray.firstIndex(where: {$0.name == recipe.name}) {
                                model.recipesArray[index].featured = recipe.featured
                            }
                        }
                }
                
                
                
                Divider()
                    .padding()
                
                HStack {
                    Text("Preparation")
                    Spacer()
                    Text("Total")
                        .multilineTextAlignment(.trailing)
                }
                .padding(.bottom, 1)
                .font(Font.custom("Avenir Heavy", size: 18))
                .overlay(Text("Cooking").font(Font.custom("Avenir Heavy", size: 18)))
                
                HStack {
                    Text(recipe.prepTime)
                    Spacer()
                    Text(recipe.totalTime)
                }
                .overlay(Text(recipe.cookTime)
                    .font(Font.custom("Avenir", size: 16)))
                .font(Font.custom("Avenir", size: 16))
                
                Divider()
                    .padding()
                
                Group {
                    
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 22))
                        .padding(.bottom,1)
                    
                    ForEach (0..<recipe.ingredients.count) { index in
                        
                        Text("• "+recipe.ingredients[index])
                            .padding(.bottom,1)
                        
                    }
                    
                    Divider()
                        .padding()
                    
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 22))
                        .padding(.bottom,1)
                    
                    ForEach (0..<recipe.directions.count) { index in
                        
                        Text("• "+recipe.directions[index])
                            .padding(.bottom,1)
                        
                    }
                    
                }
                
                
            }
            .padding([.leading, .trailing], 20.0)
            .padding(.bottom)
            .background(Color("back"))
            .cornerRadius(20)
            .padding(.top, -30)
            
            
            
            
        }
        .edgesIgnoringSafeArea(.top)
        
        
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: RecipeModel().recipesArray[2])
            .environmentObject(RecipeModel())
            .preferredColorScheme(.dark)
    }
}
