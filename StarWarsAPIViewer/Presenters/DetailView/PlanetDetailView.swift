//
//  PlanetDetailView.swift
//  StarWarsAPIViewer
//
//  Created by Emil Vaklinov on 29/06/2023.
//

import SwiftUI

struct PlanetDetailView: View {
    var planet: Planet
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(planet.name)
                .font(.title).bold()
            Text("Population: \(planet.population)")
                .font(.headline)
                .foregroundColor(.secondary)
            Text("Terrain: \(planet.terrain)")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationBarTitle(planet.name)
    }
}
