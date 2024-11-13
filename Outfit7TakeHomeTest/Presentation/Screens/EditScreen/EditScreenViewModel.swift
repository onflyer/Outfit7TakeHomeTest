//
//  EditScreenViewModel.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 13. 11. 2024..
//

import Foundation

@MainActor
class EditScreenViewModel: ObservableObject {
    
    let repository: EmployeesLocalRepository
    
    init(repository: EmployeesLocalRepository) {
        self.repository = repository
    }
    
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var age: Int = 18
    @Published var gender: Gender = .unknown
}

extension EditScreenViewModel {
    
}
