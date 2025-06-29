//
//  Coordinator.swift
//  Thamanyia
//
//  Created by Khalid on 27/06/2025.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
