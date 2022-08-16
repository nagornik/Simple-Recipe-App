//
//  StartTabView.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 06.05.2022.
//

import SwiftUI

struct StartTabView: View {
    
    @State var tabIndex = 0
    
    var body: some View {
        
        TabView(selection: $tabIndex) {
            
            FeaturedView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
                .tag(0)
            
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
                .tag(1)
            
        }
        .accentColor(.primary)
        
    }
}

struct StartTabView_Previews: PreviewProvider {
    static var previews: some View {
        StartTabView()
            .environmentObject(RecipeModel())
            .preferredColorScheme(.dark)
    }
}
