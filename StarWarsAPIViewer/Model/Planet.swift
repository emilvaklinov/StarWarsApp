//
//  Planet.swift
//  StarWarsAPIViewer
//
//  Created by Scott Runciman on 20/07/2021.
//

import Foundation

struct Planet: Hashable, Codable, Identifiable {
    let id: UUID
    let name: String
    let terrain: String
    let population: String

    init(id: UUID = UUID(), name: String, terrain: String, population: String) {
        self.id = id
        self.name = name
        self.terrain = terrain
        self.population = population
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, name, terrain, population
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedID = try container.decodeIfPresent(UUID.self, forKey: .id)
        id = decodedID ?? UUID()
        name = try container.decode(String.self, forKey: .name)
        terrain = try container.decode(String.self, forKey: .terrain)
        population = try container.decode(String.self, forKey: .population)
    }
}
