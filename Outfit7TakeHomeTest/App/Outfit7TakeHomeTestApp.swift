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
//        let instance = EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))
//        let employee = EmployeeDomainModel(id: UUID(uuidString: "7ACD09D1-CA1D-4C41-BB05-279CF7D52FF2")!, name: "test3", lastName: "test3", age: 33, gender: .unknown)
//        do {
//            try await instance.dataSource.addEmployee(employee: employee)
//        } catch {
//            print(error)
//        }
//        let result2 = try? await instance.dataSource.getEmployees()
//        print(result2)
//    }
    
    var body: some Scene {
        WindowGroup {
            HomeScreen(
                viewModel: HomeScreenViewModel(
                    repository: EmployeesLocalRepository(
                        dataSource: LocalEmployeeDataSource(
                            coreDataService: CoreDataService()
                        )
                    )
                )
            )
        }
    }
}
