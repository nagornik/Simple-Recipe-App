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
        
        if model.recipesArray.count == 0 {
            VStack {
                Text("Loading data from GitHub...")
                    .font(.title3)
                ProgressView()
            }
            .onAppear {
                Task {
                    model.recipesArray = await DataService.getDataFromJsonFromGithub()
                }
            }
        } else {
            NavigationView {
                VStack (spacing:0) {
                    if areThereAnyFeatured() {
                    GeometryReader { g in
                        
                            TabView(selection: $tabNumber) {
                                ForEach (0..<model.recipesArray.count, id:\.self) { recipe in
                                    if model.recipesArray[recipe].featured == true {
                                        
                                        GeometryReader { geo in
                                            Button {
                                                sheetShow.toggle()
                                            } label: {
                                                VStack {
                                                    GeometryReader { fr in
                                                        Image(model.recipesArray[recipe].image)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: fr.size.width, height:fr.size.height)
                                                            .clipped()
                                                    }
                                                    
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
                        VStack {
                            Text("No featured recipes\nLike any recipe to see them here")
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    
                    
                }
                .onAppear{
                    firstFeaturedIndex()
                }
                .navigationTitle(Text("Featured"))
            }
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
        
//        let index = model.recipesArray.firstIndex { r in
//            return r.featured
//        }
//        tabNumber = index ?? 0
        tabNumber = 0
    }
    
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
            .preferredColorScheme(.dark)
    }
}
