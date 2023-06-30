//
//  PlanetDetailViewModelTests.swift
//  StarWarsAPIViewerTests
//
//  Created by Emil Vaklinov on 30/06/2023.
//

import XCTest
@testable import StarWarsAPIViewer

final class PlanetDetailViewModelTests: XCTestCase {
    
    func testInitialization() {
        // Create a sample planet
        let planet = Planet(name: "Earth", terrain: "mixed", population: "2223333")
        
        // Create an instance of the view model
        let viewModel = PlanetDetailViewModel(planet: planet)
        
        // Assert that the planet property is initialized correctly
        XCTAssertEqual(viewModel.planet.name, "Earth")
        XCTAssertEqual(viewModel.planet.terrain, "mixed")
        XCTAssertEqual(viewModel.planet.population, "2223333")
    }
    
    func testDisplayDetails() {
        // Create a sample planet
        let initialPlanet = Planet(name: "Earth", terrain: "mixed", population: "2223333")

        // Create an instance of the view model
        let viewModel = PlanetDetailViewModel(planet: initialPlanet)

        // Select a new planet
        let selectedPlanet = Planet(name: "Mars", terrain: "desert", population: "1000000")
        viewModel.planet = selectedPlanet

        // Assert that the view model's properties are updated correctly
        XCTAssertEqual(viewModel.planet.name, "Mars")
        XCTAssertEqual(viewModel.planet.terrain, "desert")
        XCTAssertEqual(viewModel.planet.population, "1000000")
    }
}

