//
//  EmployeeCoreDataEntityMapper.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation

extension EmployeeCoreDataEntity {
    func toDomain() -> EmployeeDomainModel {
        return EmployeeDomainModel(id: UUID(), name: "", lastName: "", age: 1, gender: .female)
    }
}
