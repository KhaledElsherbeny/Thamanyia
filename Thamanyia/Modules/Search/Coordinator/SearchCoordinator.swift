//
//  SearchCoordinator.swift
//  Thamanyia
//
//  Created by Khalid on 28/06/2025.
//

import Foundation
import UIKit
import SwiftUI

protocol SearchCoordinatorProtocol {}

class SearchCoordinator: Coordinator, ObservableObject {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let service = SearchService()
        let repository = SearchRepository(searchService: service)
        let useCase = SearchUseCase(searchRepository: repository)
        let viewModel = SearchViewModel(searchUseCase: useCase)
        
        let rootView = NavigationStack {
            SearchView(viewModel: viewModel)
        }
        let viewController = UIHostingController(rootView: rootView)
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension SearchCoordinator: SearchCoordinatorProtocol {}
