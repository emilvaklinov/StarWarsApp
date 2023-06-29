//
//  PlanetsCollectionView.swift
//  StarWarsAPIViewer
//
//  Created by Emil Vaklinov on 29/06/2023.
//

import SwiftUI

struct PlanetsCollectionView: View {
    @StateObject private var viewModel = PlanetsCollectionViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.planets) { planet in
                VStack(alignment: .leading) {
                    Text(planet.name)
                        .font(.headline)
                    Text("Population: \(planet.population)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationBarTitle("Planets")
        }
        .onAppear {
            viewModel.fetchPlanets()
        }
    }
}

class PlanetsCollectionViewModel: ObservableObject {
    @Published var planets = [Planet]()
    
    func fetchPlanets() {
        let planetFetcher = PlanetSnapshotProvider()
        planetFetcher.fetch()
        
        planetFetcher.onSnapshotUpdate = { snapshot in
            DispatchQueue.main.async {
                self.planets = snapshot.itemIdentifiers
            }
        }
    }
}


struct PlanetsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsCollectionView()
    }
}
