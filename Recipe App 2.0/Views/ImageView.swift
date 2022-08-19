//
//  ImageView.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 19.08.2022.
//

import SwiftUI

struct ImageView: View {
    
    var recipeImage: String
    
    var body: some View {
        
        ZStack {
            if let cachedImage = DataService.getImage(forKey: recipeImage) {
                
                cachedImage
                    .resizable()
                    .scaledToFill()
                    .clipped()
                
            } else {
                
                let photoUrl = URL(string: recipeImage)
                
                AsyncImage(url: photoUrl) { phase in
                    
                    switch phase {
                            
                        case AsyncImagePhase.empty:
                            
                            ZStack {
                                ProgressView()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        case AsyncImagePhase.success(let image):
                            
                            image
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .onAppear {
                                    DataService.setImage(image: image, forKey: recipeImage)
                                }
                            
                        case AsyncImagePhase.failure:
                            GeometryReader { geo in
                                ZStack {
                                    Color(.gray)
                                        .opacity(0.3)
                                    Image(systemName: "photo.fill.on.rectangle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.primary.opacity(0.7))
                                        .frame(width: geo.size.width/3, height: geo.size.height/3, alignment: .center)
                                }
                            }
                    }
                }
                
            }
        }
    }
}


//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView()
//    }
//}
