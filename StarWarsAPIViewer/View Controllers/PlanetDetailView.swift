//
//  PlanetDetailView.swift
//  StarWarsAPIViewer
//
//  Created by Emil Vaklinov on 29/06/2023.
//

import SwiftUI

struct PlanetDetailView: View {
    let planet: Planet
    
    var body: some View {
        VStack {
            Text(planet.name)
                .font(.title)
                .padding()
            Text("Population: \(planet.population)")
                .font(.subheadline)
                .padding()
        }
    }
}

//struct PlanetDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetDetailView(planet: "po")
//    }
//}
