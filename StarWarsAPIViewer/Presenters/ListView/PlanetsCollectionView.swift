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
    @State private var isRefreshing = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.planets) { planet in
                        NavigationLink(destination: PlanetDetailView(planet: planet), tag: planet, selection: $selectedPlanet) {
                            VStack(alignment: .leading) {
                                Text(planet.name)
                                    .font(.title)
                            }
                        }
                    }
                }
                .padding(.top, 20)
            }
            .navigationBarTitle("Planets")
            .navigationBarItems(trailing:
                Button(action: {
                    refreshData()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
            .overlay(
                RefreshControl(isRefreshing: $isRefreshing) {
                    refreshData()
                }
            )
            .onAppear {
                viewModel.fetchPlanets {
                    print("Data Refreshed")
                    isRefreshing = false
                }
            }
        }
    }
    
    private func refreshData() {
        isRefreshing = true
        viewModel.fetchPlanets {
            DispatchQueue.main.async {
                isRefreshing = false
                print("Data Refreshed")
            }
        }
    }
}

struct PlanetsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsCollectionView()
    }
}
