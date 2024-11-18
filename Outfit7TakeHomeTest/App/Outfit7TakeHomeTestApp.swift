//
//  Outfit7TakeHomeTestApp.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 11. 11. 2024..
//

import SwiftUI

@main
struct Outfit7TakeHomeTestApp: App {
    
    @StateObject var repository = HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource (coreDataService: CoreDataService())))
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(repository)
        }
    }
}

