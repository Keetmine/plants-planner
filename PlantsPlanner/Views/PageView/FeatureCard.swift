//
//  FeatureCard.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 29.11.22.
//

import SwiftUI

struct FeatureCard: View {
    var plant: Plant
    
    var body: some View {
        plant.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(plant: plant)
            }
    }
}

struct TextOverlay: View {
    var plant: Plant

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(plant.name)
                    .font(.title)
                    .bold()
                Text(plant.category.rawValue)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(plant: ModelData().features[0])
    }
}
