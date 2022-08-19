//
//  FeaturedView.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var tabNumber = 0
    @State var sheetShow = false
    
    var body: some View {
        
        ZStack {
            if model.recipesArray.count == 0 {
                
                loadingScreen
                
            } else {
                
                NavigationView {
                    
                    VStack (spacing:0) {
                        featuredCardsAndInfo
                    }
                    .onAppear{
                        firstFeaturedIndex()
                    }
                    .background(Color("back"))
                    .navigationTitle(Text("Featured"))
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("back"))
        
    }
    
    var loadingScreen: some View {
        VStack {
            Text("Loading data from GitHub...")
                .font(.title3)
            ProgressView()
        }
        .onAppear {
            Task {
                model.recipesArray = await DataService.getDataFromJsonFromGithub()
                model.recipesArray.sort(by: {$0.name < $1.name})
            }
        }
    }
    
    @ViewBuilder
    var featuredCardsAndInfo: some View {
        
        if areThereAnyFeatured() {
            
            GeometryReader { g in
                
                TabView(selection: $tabNumber) {
                    
                    ForEach (0..<model.recipesArray.count) { recipe in
                        
                        if model.recipesArray[recipe].featured == true {
                            
                            GeometryReader { geo in
                                
                                Button {
                                    sheetShow.toggle()
                                } label: {
                                    VStack {
                                        
                                        ImageView(recipeImage: model.recipesArray[recipe].image)
                                        
                                        Text(model.recipesArray[recipe].name)
                                            .font(Font.custom("Avenir", size: 18))
                                            .foregroundColor(.primary)
                                            .padding(8)
                                        
                                    }
                                    .frame(width: geo.size.width, height: geo.size.height-40)
                                }
                                .background(Color("back"))
                                .cornerRadius(20)
                                .shadow(color: .primary.opacity(0.2), radius: 5, x: 0, y: 5)
                                .sheet(isPresented: $sheetShow) {
                                    RecipeDetailView(recipe: model.recipesArray[recipe])
                                }
                                
                            }
                            
                        }
                        
                    }
                    .padding(g.size.width/20)
                    
                }
                .frame(width: g.size.width)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
            }
            
            HStack {
                VStack (alignment: .leading, spacing: 0) {
                    Text("Preparation Time:")
                        .font(Font.custom("Avenir Heavy", size: 18))
                    Text(model.recipesArray[tabNumber].prepTime)
                        .font(Font.custom("Avenir", size: 16))
                    Text("Highlights")
                        .font(Font.custom("Avenir Heavy", size: 18))
                    Text(model.recipesArray[tabNumber].highlights.joined(separator: ", "))
                        .font(Font.custom("Avenir", size: 16))
                }
                .padding([.leading, .bottom], 30)
                
                Spacer()
                
            }
            
        } else {
            
            Text("No featured recipes\nLike any recipe to see them here")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("back"))
            
        }
    }
    
    func areThereAnyFeatured() -> Bool {
        for recipe in model.recipesArray {
            if recipe.featured {
                return true
            }
        }
        return false
    }
    
    func firstFeaturedIndex() {
        let index = model.recipesArray.firstIndex(where: {$0.featured})
        tabNumber = index ?? 0
    }
    
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        FeaturedView()
            .preferredColorScheme(.dark)
            .environmentObject(model)
    }
}

