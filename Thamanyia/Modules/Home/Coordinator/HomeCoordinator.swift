//
//  HomeCoordinator.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation
import UIKit
import SwiftUI

protocol HomeCoordinatorProtocol {
    func showSearch()
}

class HomeCoordinator: Coordinator, ObservableObject {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let service = HomeService()
        let repository = HomeRepository(homeService: service)
        let useCase = HomeUseCase(homeRepository: repository)
        let viewModel = HomeViewModel(homeUseCase: useCase, coordinator: self)
        
        let view = UIHostingController(rootView: HomeView(viewModel: viewModel))
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(view, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showSearch() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        searchCoordinator.start()
    }
}
