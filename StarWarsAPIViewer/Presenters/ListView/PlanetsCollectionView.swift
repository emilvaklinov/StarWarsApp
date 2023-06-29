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
                .onAppear {
                    viewModel.fetchPlanets()
                }
            }
            .navigationBarTitle("Planets")
            .overlay(
                RefreshControl(isRefreshing: $isRefreshing, onRefresh: {
                    refreshData()
                })
            )
        }
    }
    
    private func refreshData() {
        isRefreshing = true
        viewModel.fetchPlanets()
        isRefreshing = false
    }
}

struct RefreshControl: View {
    @Binding var isRefreshing: Bool
    let onRefresh: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            if isRefreshing {
                ProgressView()
                    .offset(y: -(geometry.size.height / 2))
                    .foregroundColor(.gray)
            }
        }
        .frame(height: 0)
    }
}

struct PlanetsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsCollectionView()
    }
}
