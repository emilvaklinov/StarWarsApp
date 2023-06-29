//
//  PlanetDetailView.swift
//  StarWarsAPIViewer
//
//  Created by Emil Vaklinov on 29/06/2023.
//

import SwiftUI

struct PlanetDetailView: View {
    @StateObject private var viewModel: PlanetDetailViewModel
    
    init(planet: Planet) {
        _viewModel = StateObject(wrappedValue: PlanetDetailViewModel(planet: planet))
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(viewModel.planet.name)
                .font(.title).bold()
            Text("Population: \(viewModel.planet.population)")
                .font(.headline)
                .foregroundColor(.secondary)
            Text("Terrain: \(viewModel.planet.terrain)")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationBarTitle(viewModel.planet.name)
    }
}
