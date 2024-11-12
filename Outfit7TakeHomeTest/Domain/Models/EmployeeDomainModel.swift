//
//  EmployeeDomainModel.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation

struct EmployeeDomainModel: Identifiable {
    
    let id: UUID
    let name: String
    let lastName: String
    let age: Int
    let gender: Gender
    
}
