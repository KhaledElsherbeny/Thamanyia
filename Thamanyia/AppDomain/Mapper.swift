//
//  Mapper.swift
//  Thamanyia
//
//  Created by Khalid on 29/06/2025.
//

import Foundation

protocol DomainMappable {
    associatedtype DomainModel
    func toDomain() -> DomainModel
}
