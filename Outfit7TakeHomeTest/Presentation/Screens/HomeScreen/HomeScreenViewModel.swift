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
    
    @Published var employee: EmployeeDomainModel? = nil
    
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var age: Int = 18
    @Published var gender: Gender = .unknown
}

extension HomeScreenViewModel {
    
    var isFormValid: Bool {
        !name.isEmpty && !lastName.isEmpty
    }
    
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
    
    func removeEmployee(at offsets: IndexSet) {
        offsets.forEach { index in
            let employee = self.employees[index]
            Task {
                await repository.removeEmployee(employee: employee)
                await fetchEmployees()
            }
        }
    }
    
    func getEmployee(id: UUID) {
        let result = repository.getOneEmployee(id: id)
        employee = result
        if let unwrappedEmployee = employee {
            name = unwrappedEmployee.name
            lastName = unwrappedEmployee.lastName
            age = unwrappedEmployee.age
            gender = unwrappedEmployee.gender
        }
    }
    
    func updateEmployee(employee: EmployeeDomainModel) {
        do {
            try repository.updateEmployee(employee: employee)
        } catch {
            print(error)
        }
    }
    
    func getAverageAge() -> Double {
       let ageSum = employees.map {
            $0.age
        }
        let averageAge = Double(ageSum.average())
        return averageAge
    }
    
    func getGenderPercentage() -> String {
        let employeeCount = employees.count
        let maleCount = employees.filter({ $0.gender == .male }).count
        let femaleCount = employees.filter({ $0.gender == .female }).count
        
        let malePercentage = (Double(maleCount) / Double(employeeCount)) * 100
        let femalePercentage = (Double(femaleCount) / Double(employeeCount)) * 100
        
        return String("Male to female ratio: \(malePercentage) to \(femalePercentage)%")
    }
}
