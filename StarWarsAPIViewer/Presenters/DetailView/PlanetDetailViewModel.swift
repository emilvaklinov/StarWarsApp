//
//  PlanetDetailViewModel.swift
//  StarWarsAPIViewer
//
//  Created by Emil Vaklinov on 29/06/2023.
//

import Foundation

class PlanetDetailViewModel: ObservableObject {
    @Published var planet: Planet
    
    init(planet: Planet) {
        self.planet = planet
    }
}
