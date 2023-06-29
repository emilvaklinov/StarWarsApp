//
//  PlanetsCollectionViewController.swift
//  StarWarsAPIViewer
//
//  Created by Scott Runciman on 20/07/2021.
//

import UIKit
import SwiftUI

class PlanetsCollectionViewController: UICollectionViewController {
    private let snapshotProvider = PlanetSnapshotProvider()
    private let reuseIdentifier = "CellReuseIdentifier"
    
    private lazy var planetCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Planet> { cell, indexPath, planet in
        var configuration = cell.defaultContentConfiguration()
        configuration.text = planet.name
        configuration.secondaryText = "Population: \(planet.population)"
        cell.contentConfiguration = configuration
    }
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<PlanetSnapshotProvider.PlanetSections, Planet> = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, planet in
        return collectionView.dequeueConfiguredReusableCell(using: self.planetCellRegistration, for: indexPath, item: planet)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register your cell with the collection view
        collectionView.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Set up your data source
        collectionView.dataSource = dataSource
        
        // Set up your collection view layout
        let listAppearance = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: listAppearance)
        
        // Set up your snapshot provider
        snapshotProvider.onSnapshotUpdate = { snapshot in
            self.dataSource.apply(snapshot)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        snapshotProvider.fetch()
    }
    
    @objc private func didSelectPlanet(_ sender: UITapGestureRecognizer) {
        guard let cell = sender.view as? UICollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell),
              let planet = dataSource.itemIdentifier(for: indexPath) else {
            return
        }
        
        let planetDetailView = PlanetDetailView(planet: planet)
        let hostingController = UIHostingController(rootView: planetDetailView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
