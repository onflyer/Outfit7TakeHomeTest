//
//  HomeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeScreenViewModel
    
    var body: some View {
        NavigationStack {
            Text("")
                .navigationTitle("Employees")
        }
        
    }
}

#Preview {
    HomeScreen(viewModel: HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
