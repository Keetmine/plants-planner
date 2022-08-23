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
       }
    }
}

struct PlantRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlantRow(plant: Plants[0])
            PlantRow(plant: Plants[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

        

    }
}
