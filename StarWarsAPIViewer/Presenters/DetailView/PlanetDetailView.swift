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
        VStack {
            Text(planet.name)
                .font(.title)
            Text("Population: \(planet.population)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            // Add more details or customizations as needed
        }
        .navigationBarTitle(planet.name)
    }
}

//struct PlanetDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetDetailView(planet: "po")
//    }
//}
