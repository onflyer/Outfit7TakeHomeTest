//
//  Outfit7TakeHomeTestApp.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import SwiftUI

@main
struct Outfit7TakeHomeTestApp: App {
    
    @StateObject var viewModel = HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService())))
    
    //    static func main() async {
    //        let instance = EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))
    //        let employee = EmployeeDomainModel(id: UUID(), name: "test3", lastName: "test3", age: 33, gender: .unknown)
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
            HomeScreen()
                .environmentObject(viewModel)
        }
    }
}
