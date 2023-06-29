//
//  PlanetsCollectionViewModel.swift
//  StarWarsAPIViewer
//
//  Created by Emil Vaklinov on 29/06/2023.
//

import Foundation

class PlanetsCollectionViewModel: ObservableObject {
    @Published var planets = [Planet]()
    
    func fetchPlanets(completion: @escaping () -> Void) {
        let planetFetcher = PlanetSnapshotProvider()
        planetFetcher.fetch()
        
        planetFetcher.onSnapshotUpdate = { snapshot in
            DispatchQueue.main.async {
                self.planets = snapshot.itemIdentifiers
                completion()
            }
        }
    }
}
