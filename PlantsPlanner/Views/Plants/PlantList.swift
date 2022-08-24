//
//  PlantList.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import SwiftUI

struct PlantList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredPlants: [Plant] {
        modelData.Plants.filter { plant in
            (!showFavoritesOnly || plant.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredPlants) { Plant in
                    NavigationLink {
                        PlantDetail(plant: Plant)
                    } label: {
                        PlantRow(plant: Plant)
                    }
                }
            }
            .navigationTitle("Plants")
        }
    }
}

struct PlantList_Previews: PreviewProvider {
    static var previews: some View {
        PlantList()
            .environmentObject(ModelData())
    }
}
