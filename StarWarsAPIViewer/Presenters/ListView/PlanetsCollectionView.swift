//
//  PlanetsCollectionView.swift
//  StarWarsAPIViewer
//
//  Created by Emil Vaklinov on 29/06/2023.
//

import SwiftUI

struct PlanetsCollectionView: View {
    @StateObject private var viewModel = PlanetsCollectionViewModel()
    @State private var selectedPlanet: Planet? = nil
    
    var body: some View {
        NavigationView {
            List(viewModel.planets) { planet in
                // Wrap each list item with a NavigationLink
                NavigationLink(destination: PlanetDetailView(planet: planet), tag: planet, selection: $selectedPlanet) {
                    VStack(alignment: .leading) {
                        Text(planet.name)
                            .font(.headline)
                        Text("Population: \(planet.population)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Planets")
        }
        .onAppear {
            viewModel.fetchPlanets()
        }
    }
}

struct PlanetsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsCollectionView()
    }
}
