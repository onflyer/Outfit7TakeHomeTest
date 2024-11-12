//
//  HomeScreenViewModel.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import Foundation

class HomeScreenViewModel: ObservableObject {
    
    @Published var state: ViewState = .idle
    @Published var employees: [EmployeeDomainModel] = []
    
    let repository: EmployeesLocalRepository
    
    init(repository: EmployeesLocalRepository) {
        self.repository = repository
    }
}
