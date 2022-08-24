//
//  PlantDetail.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import SwiftUI

struct PlantDetail: View {
    
    var plant: Plant
    
    var body: some View {
        ScrollView {
            BgView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 150)
            
            CircleImage(image: plant.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(plant.name)
                    .font(.title)
                HStack {
                    Text(plant.category)
                        .font(.subheadline)
                    Spacer()
                    Text(plant.category)
                        .font(.subheadline)
                }
                
                Divider()

                Text("About \(plant.name)")
                   .font(.title2)
                
                Text(plant.description)
                Text(plant.description)

            }
            .padding()
            Spacer()
        }
        .navigationTitle(plant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlantDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetail(plant: Plants[1])
    }
}
