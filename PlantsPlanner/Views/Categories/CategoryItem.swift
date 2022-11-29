//
//  CategoryItem.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 12.09.22.
//

import SwiftUI

struct CategoryItem: View {
    var plant: Plant
    
    var body: some View {
        VStack(alignment: .leading) {
            plant.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(plant.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(plant: ModelData().plants[0])
    }
}
