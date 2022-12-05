//
//  GardenHome.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 30.11.22.
//

import SwiftUI

struct GardenHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(modelData.profile.username + " " + "plants")
                        .font(.title3)
                    Text("My garden")
                        .font(.title)
                }
                Spacer()
                Button {
                   showingProfile.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(.LightGreen)
            }
            .foregroundColor(.DarkGreen)
            
            .padding()
            
            NavigationView {
                List {
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key,items: modelData.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.inset)
                .navigationTitle("Featured")
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(modelData)
                }
            }
        }
    }
}

struct GardenHome_Previews: PreviewProvider {
    static var previews: some View {
        GardenHome()
            .environmentObject(ModelData())

    }
}
