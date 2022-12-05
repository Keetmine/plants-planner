//
//  ContentView.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .garden

    enum Tab {
        case garden
        case reminders
        case search
        case diagnose
        case explore
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem{
                    Label("Explore", systemImage: "books.vertical")
                        .environment(\.symbolVariants, .none)
                }
                .tag(Tab.explore)

            PlantList()
                .tabItem{
                    Label("Diagnose", systemImage: "dot.viewfinder")
                }
               .tag(Tab.diagnose)
            
            PlantList()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
               .tag(Tab.search)
            
            PlantList()
                .tabItem{
                    Label("Reminders", systemImage: "clock.badge.exclamationmark")
                        .environment(\.symbolVariants, .none)
                }
               .tag(Tab.reminders)
            
            GardenHome()
                .tabItem{
                    Label("My garden", systemImage: "leaf")
                        .environment(\.symbolVariants, .none)
                }
               .tag(Tab.garden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
