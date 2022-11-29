//
//  PlantRow.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import SwiftUI

struct PlantRow: View {
    var plant: Plant
    
    var body: some View {
        HStack {
            plant.image
               .resizable()
               .frame(width: 50, height: 50)
            Text(plant.name)

            Spacer()
            
            if plant.isFavorite {
               Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
       }
    }
}

struct PlantRow_Previews: PreviewProvider {
    static var plants = ModelData().plants
    
    static var previews: some View {
        Group {
            PlantRow(plant: plants[0])
            PlantRow(plant: plants[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
