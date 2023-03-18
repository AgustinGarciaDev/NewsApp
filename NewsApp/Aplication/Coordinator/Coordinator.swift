//
//  Coordinator.swift
//  NewsApp
//
//  Created by Agustinch on 15/03/2023.
//

import UIKit

final class Coordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var network: RepositoriesAPIProtocol
    
    // MARK: Init
    
    init(navigationController: UINavigationController, network: RepositoriesAPIProtocol = RepositoriesAPI()) {
        self.navigationController = navigationController
        self.network = network
    }
    
    // MARK: Coordinator Conformance
    
    func start() {
        let useCase = NewsListUseCase(api: network)
        let viewModel = NewsListViewModel(useCase: useCase)
        let viewController = NewsListViewController.create(with: viewModel)
        viewModel.requestNewsStartup()
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showNewDetail(with new: InfoNew) {
        let viewModel = NewDetailViewModel(infoNew: new)
        let viewController = NewDetailViewController.create(with: viewModel)
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
}
