//
//  PlantDetail.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import SwiftUI

struct PlantDetail: View {
    @EnvironmentObject var modelData: ModelData
    var plant: Plant
    
    var plantIndex: Int {
        modelData.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
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
                    Text(plant.name)
                        .font(.subheadline)
                    Spacer()
                    FavoriteButton(isSet: $modelData.plants[plantIndex].isFavorite)
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
    static let modelData = ModelData()

    static var previews: some View {
        PlantDetail(plant: modelData.plants[0])
            .environmentObject(modelData)
    }
}
