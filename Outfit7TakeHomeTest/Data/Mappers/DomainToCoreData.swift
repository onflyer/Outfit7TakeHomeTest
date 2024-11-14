//
//  EmployeeDomainModel+Extension.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation
import CoreData

extension EmployeeDomainModel {
    
    func toCoreDataEntity(in context: NSManagedObjectContext) -> EmployeeCoreDataEntity {
        let employeeCoreDataEntity = EmployeeCoreDataEntity(id: id, name: name, lastName: lastName, age: age, gender: gender.rawValue, context: context)
        employeeCoreDataEntity.id = id
        employeeCoreDataEntity.name = name
        employeeCoreDataEntity.lastName = lastName
        employeeCoreDataEntity.age = age
        employeeCoreDataEntity.gender = gender.rawValue
        
        return employeeCoreDataEntity
    }
}
