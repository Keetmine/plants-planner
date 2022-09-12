//
//  CategoryRow.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 12.09.22.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Plant]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { Plant in
                        NavigationLink {
                            PlantDetail(plant: Plant)
                        } label: {
                            CategoryItem(plant: Plant)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    
    static var plants = ModelData().Plants
    
    static var previews: some View {
        CategoryRow(
            categoryName: plants[0].category.rawValue,
            items: Array(plants.prefix(4))
        )
    }
}
