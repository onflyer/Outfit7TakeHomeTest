//
//  Outfit7TakeHomeTestApp.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import SwiftUI

@main
struct Outfit7TakeHomeTestApp: App {
    
//    static func main() async {
//        let instance = EmployeesLocalRepository(repository: LocalEmployeeDataSource(coreDataService: CoreDataService()))
//        let employee = EmployeeDomainModel(id: UUID(uuidString: "7ACD09D1-CA1D-4C41-BB05-279CF7D52FF2")!, name: "test3", lastName: "test3", age: 33, gender: .unknown)
//        do {
//            try await instance.repository.addEmployee(employee: employee)
//        } catch {
//            print(error)
//        }
//       let result = try? await instance.repository.updateEmployee(employee: employee)
//        let result2 = try? await instance.repository.getEmployees()
//        print(result2)
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView() 
        }
    }
}
