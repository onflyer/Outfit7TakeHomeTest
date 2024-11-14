//
//  EditScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 13. 11. 2024..
//

import SwiftUI

struct EditScreen: View {
    
    @StateObject var viewModel = EditScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService())))
    
    @EnvironmentObject var homeScreen: HomeScreenViewModel
    
    
    @Environment (\.dismiss) private var dismiss
    
    let id: UUID
        
    var body: some View {
        NavigationStack {
            Form {
                Section("Info") {
                    TextField("Enter employee's name", text: $viewModel.name)
                    TextField("Enter employee's last name", text: $viewModel.lastName)
                    Picker("Select age", selection: $viewModel.age) {
                        ForEach(18..<100) { age in
                            Text("\(age)").tag(age)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Gender", selection: $viewModel.gender) {
                        ForEach(Gender.allCases) { gender in
                            Text(gender.rawValue)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        viewModel.updateEmployee(employee: EmployeeDomainModel(id: viewModel.employee!.id, name: viewModel.name, lastName: viewModel.lastName, age: viewModel.age, gender: viewModel.gender))
                        Task {
                            await homeScreen.fetchEmployees()
                        }
                        dismiss()
                        
                    }
                }
            }
            .task {
                viewModel.getEmployee(id: id)
            }
            .navigationTitle("Edit employee")
        }
    }
}

#Preview {
    EditScreen(viewModel: EditScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))), id: UUID())
    
}
