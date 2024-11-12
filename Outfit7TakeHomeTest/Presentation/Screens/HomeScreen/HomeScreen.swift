//
//  HomeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeScreenViewModel(
        repository: EmployeesLocalRepository(
            repository: LocalEmployeeDataSource(
                coreDataService: CoreDataService())))
    
    var body: some View {
        NavigationStack {
        Text("")
            .navigationTitle("Employees")
        }
        
    }
}

#Preview {
    HomeScreen()
}
