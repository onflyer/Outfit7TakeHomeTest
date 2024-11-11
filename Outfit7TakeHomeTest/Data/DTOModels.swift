//
//  DTOModels.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import Foundation
import CoreData

extension EmployeeCoreDataEntity {
    
    public var id: UUID {
        get {id_ ?? UUID()}
        set {id_ = newValue}
    }
    public var name: String {
        get {name_ ?? "N/A"}
        set {name_ = newValue}
    }
    
    public var lastName: String {
        get {lastName_ ?? "N/A"}
        set {lastName_ = newValue}
    }
    
    public var age: Int {
        get {Int(age_)}
        set {age_ = Int64(newValue)}
    }
    
    public var gender: String {
        get {gender_ ?? "N/A"
        }
        set {gender_ = newValue}
    }
    
    convenience init(id: UUID, name: String, lastName: String, age: Int, gender: Gender.RawValue, context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = id
        self.name = name
        self.lastName = lastName
        self.gender = gender
    }
}
