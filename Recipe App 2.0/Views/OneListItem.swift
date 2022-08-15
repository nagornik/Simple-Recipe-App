//
//  OneListItem.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import SwiftUI

struct OneListItem: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        
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
            
            
            Spacer()
            
            if recipe.featured {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .padding(4)
            }
            
        }
        
        
    }
}

struct OneListItem_Previews: PreviewProvider {
    static var previews: some View {
        OneListItem(recipe: RecipeModel().recipesArray[1])
    }
}
