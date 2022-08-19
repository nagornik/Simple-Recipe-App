//
//  OneListItem.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import SwiftUI

struct OneListItem: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var recipe:Recipe
    
    var body: some View {
        
        
        ZStack {
            
                HStack {
                    
                    ImageView(recipeImage: recipe.image)
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                        .padding(5)
                        
                    VStack (alignment: .leading) {
                        Text(recipe.name)
                            .font(.title3.bold())
                                
                        Text(recipe.totalTime)
                            .font(.subheadline)
                            .fontWeight(.light)
                            
                    }
                    
                    Spacer()
    
                    Image(systemName: recipe.featured ? "heart.fill" : "heart")
                        .font(.system(size: 20))
                        .foregroundColor(.red)
                        .padding(4)
                        .onTapGesture {
                            model.markFeatured(recipe: recipe)
                        }
                }

        }
        
    }
    

}

//struct OneListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        OneListItem(recipe: RecipeModel().recipesArray[1])
//            .environmentObject(RecipeModel())
//    }
//}
