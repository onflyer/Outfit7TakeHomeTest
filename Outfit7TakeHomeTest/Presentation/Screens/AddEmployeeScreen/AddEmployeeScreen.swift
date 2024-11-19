//
//  AddEmployeeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct AddEmployeeScreen: View {
    
    @EnvironmentObject var viewModel: EmployeeLocalRepository
    @Environment (\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var age: Int = 18
    @State private var gender: Gender = .unknown
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Info") {
                    nameTextField
                    lastNameTextField
                    agePicker
                    genderPicker
                }
            }
            .toolbar {
                toolbarCancelButton
                toolbarDoneButton
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Add employee")
        }
    }
}

extension AddEmployeeScreen {
    
    var isFormValid: Bool {
        !name.isEmpty && !lastName.isEmpty
    }
    
    var nameTextField: some View {
        TextField("Enter employee's name", text: $name)
    }
    
    var lastNameTextField: some View {
        TextField("Enter employee's last name", text: $lastName)
    }
    
    var agePicker: some View {
        Picker("Select age", selection: $age) {
            ForEach(18..<100) { age in
                Text("\(age)").tag(age)
            }
        }
        .pickerStyle(.menu)
    }
    
    var genderPicker: some View {
        Picker("Gender", selection: $gender) {
            ForEach(Gender.allCases) { gender in
                Text(gender.rawValue)
            }
        }
    }
    
    var toolbarCancelButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button("Cancel") {
                dismiss()
            }
        }
    }
    
    var toolbarDoneButton: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button("Done") {
                let employee = EmployeeDomainModel(id: UUID(), name: name, lastName: lastName, age: age, gender: gender)
                Task {
                    await viewModel.addEmployee(employee: employee)
                }
                dismiss()
            }
            .disabled(!isFormValid)
        }
    }
}

#Preview {
    AddEmployeeScreen()
        .environmentObject(EmployeeLocalRepository(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
