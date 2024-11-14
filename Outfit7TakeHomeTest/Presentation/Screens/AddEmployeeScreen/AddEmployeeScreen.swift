//
//  AddEmployeeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct AddEmployeeScreen: View {
    
    @EnvironmentObject var viewModel: HomeScreenViewModel
    
    @Environment (\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var age: Int = 18
    @State private var gender: Gender = .unknown
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Info") {
                    TextField("Enter employee's name", text: $name)
                    TextField("Enter employee's last name", text: $lastName)
                    Picker("Select age", selection: $age) {
                        ForEach(18..<100) { age in
                            Text("\(age)").tag(age)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Gender", selection: $gender) {
                        ForEach(Gender.allCases) { gender in
                            Text(gender.rawValue)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                       dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        let employee = EmployeeDomainModel(id: UUID(), name: name, lastName: lastName, age: age, gender: gender)
                        Task {
                           await viewModel.addEmployee(employee: employee)
                        }
                        dismiss()
                    }
                    .disabled(!viewModel.isFormValid)
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Add employee")
        }
    }
}

#Preview {
    AddEmployeeScreen()
        .environmentObject(HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
