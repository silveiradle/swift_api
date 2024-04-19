//
//  NovoAppApp.swift
//  NovoApp
//
//  Created by aluno06 on 16/04/24.
//

import SwiftUI

@main
struct NovoAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                
                NavigationStack {
                    MainView()
                }
                .tabItem{
                    Label("First", systemImage: "house")
                }
                
                ActorsView()
                    .tabItem{
                        Label("second", systemImage: "house")
                    }
            }
            
        }
    }
}
