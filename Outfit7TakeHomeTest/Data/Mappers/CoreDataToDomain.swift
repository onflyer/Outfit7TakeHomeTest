//
//  EmployeeCoreDataEntityMapper.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation

extension EmployeeCoreDataEntity {
    
    func toDomain() -> EmployeeDomainModel {
        EmployeeDomainModel(id: id, name: name, lastName: lastName, age: age, gender: Gender(rawValue: gender) ?? .unknown)
    }
}
