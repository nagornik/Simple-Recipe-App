//
//  Recipe_App_2_0.swift
//  Recipe App 2.0
//
//  Created by Anton Nagornyi on 05.05.2022.
//

import SwiftUI

@main
struct Recipe_App_2_0: App {
    var body: some Scene {
        WindowGroup {
            StartTabView()
                .environmentObject(RecipeModel())
        }
    }
}
