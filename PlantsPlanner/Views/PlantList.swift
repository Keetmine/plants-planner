//
//  PlantList.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import SwiftUI

struct PlantList: View {
    var body: some View {
        NavigationView {
            List(Plants) { Plant in
                NavigationLink {
                    PlantDetail(plant: Plant)
                } label: {
                    PlantRow(plant: Plant)
                }
            }
            .navigationTitle("Plants")
        }
    }
}

struct PlantList_Previews: PreviewProvider {
    static var previews: some View {
        PlantList()
            ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                PlantList()
                  .previewDevice(PreviewDevice(rawValue: deviceName))
            }
        
    }
}
