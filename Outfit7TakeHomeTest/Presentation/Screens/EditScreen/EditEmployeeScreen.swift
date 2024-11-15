//
//  EditScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 13. 11. 2024..
//

import SwiftUI

struct EditEmployeeScreen: View {
    
    @EnvironmentObject var viewModel: HomeScreenViewModel
    @Environment (\.dismiss) private var dismiss
    
    let id: UUID
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Info") {
                    nameTextfield
                    lastNameTextfield
                    agePicker
                    genderPicker
                }
            }
            .toolbar {
                toolbarButtonCancel
                toolbarButtonDone
            }
            .navigationTitle("Edit employee")
            .task {
                viewModel.getEmployee(id: id)
            }
        }
    }
}

extension EditEmployeeScreen {
    var nameTextfield: some View {
        TextField("Enter employee's name", text: $viewModel.name)
        
    }
    
    var lastNameTextfield: some View {
        TextField("Enter employee's last name", text: $viewModel.lastName)
        
    }
    
    var agePicker: some View {
        Picker("Select age", selection: $viewModel.age) {
            ForEach(18..<100) { age in
                Text("\(age)").tag(age)
            }
        }
        .pickerStyle(.menu)
        
    }
    
    var genderPicker: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases) { gender in
                Text(gender.rawValue)
            }
        }
    }
    
    var toolbarButtonDone: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button("Done") {
                viewModel.updateEmployee(employee: EmployeeDomainModel(id: viewModel.employee!.id, name: viewModel.name, lastName: viewModel.lastName, age: viewModel.age, gender: viewModel.gender))
                Task {
                    await viewModel.fetchEmployees()
                }
                dismiss()
                
            }
            .disabled(!viewModel.isFormValid)
        }
    }
    
    var toolbarButtonCancel: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Cancel") {
                dismiss()
            }
        }
    }
}

#Preview {
    EditEmployeeScreen(id: UUID())
        .environmentObject(HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
    
}
