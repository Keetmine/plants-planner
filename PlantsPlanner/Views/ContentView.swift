//
//  ContentView.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var modelData = ModelData()

    var body: some View {
        PlantList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
