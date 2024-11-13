//
//  HomeScreenViewModel.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import Foundation

@MainActor
class HomeScreenViewModel: ObservableObject {
    
    @Published var state: ViewState = .idle
    @Published var employees: [EmployeeDomainModel] = []
    
    let repository: EmployeesLocalRepository
    
    init(repository: EmployeesLocalRepository) {
        self.repository = repository
    }
}

extension HomeScreenViewModel {
    
    func fetchEmployees() async {
        do {
            state = .loading
            let result = try await repository.getEmployees()
            employees = result
            if employees.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        } catch  {
            print(error)
            state = .error(error.localizedDescription)
        }
    }
    
    func addEmployee(employee: EmployeeDomainModel) async {
        let employee = EmployeeDomainModel(id: employee.id, name: employee.name, lastName: employee.lastName, age: employee.age, gender: employee.gender)
        do {
            try await repository.addEmployee(employee: employee)
            await fetchEmployees()
        } catch {
            print(error)
        }
    }
}
