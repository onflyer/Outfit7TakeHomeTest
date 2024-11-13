//
//  EditScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 13. 11. 2024..
//

import SwiftUI

struct EditScreen: View {
    
    @ObservedObject var viewModel: EditScreenViewModel
    
    @Environment (\.dismiss) private var dismiss
    
    var employee: EmployeeDomainModel
    
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
                        
                        dismiss()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Edit employee")
        }
    }
}

#Preview {
    EditScreen(viewModel: EditScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))), employee: EmployeeDomainModel(id: UUID(), name: "name", lastName: "last name", age: 31, gender: .male))
}
