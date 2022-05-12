//
//  RecipeDetailView.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            
            
            Image(recipe.image)
                .resizable()
                .scaledToFit()
            //                    .cornerRadius(50)
            
            
            VStack (alignment: .leading) {
                
                Text(recipe.name)
                    .font(Font.custom("Avenir Black", size: 26))
//                    .padding(.horizontal)
                    .padding(.top)
                Text(recipe.description)
                    .font(Font.custom("Avenir", size: 16))
//                    .padding(.leading)
                Divider()
                    .padding()
                
                HStack {
                    Text("Preparation")
                    Spacer()
                    Text("Total")
                        .multilineTextAlignment(.trailing)
                }.padding(.bottom, 1)
                    .font(Font.custom("Avenir Heavy", size: 18))
                    .overlay(Text("Cooking").font(Font.custom("Avenir Heavy", size: 18)))
                HStack {
                    Text(recipe.prepTime)
                    Spacer()
                    Text(recipe.totalTime)
                }.overlay(Text(recipe.cookTime).font(Font.custom("Avenir", size: 16)))
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
                
                
            }.padding([.leading, .trailing], 20.0)
                .padding(.bottom)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(20)
                .padding(.top, -30)
            
            
            
            
        }.edgesIgnoringSafeArea(.top)
        
        
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: RecipeModel().recipesArray[2])
    }
}
