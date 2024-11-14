//
//  DetailScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct DetailScreen: View {
    
    @StateObject var viewModel = EditScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService())))
    
    let employeeId: UUID
    
    @State private var isShowingEdit: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.tertiary)
                        .padding(30)
                    HStack {
                        Text(viewModel.name)
                        Text(viewModel.lastName)
                    }
                    .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            
            Spacer()
            
            Form(content: {
                Section("Personal info") {
                    VStack(alignment: .leading) {
                        Text("Age")
                            .font(.footnote)
                        Text("\(viewModel.age)")
                    }
                    VStack(alignment: .leading) {
                        Text("Gender")
                            .font(.footnote)
                        Text("\(viewModel.gender.rawValue)")
                    }
                }
            })
        }
        .sheet(isPresented: $isShowingEdit, content: {
            EditScreen(id: employeeId)
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    isShowingEdit.toggle()
                }

            }
        }
        .task {
            viewModel.getEmployee(id: employeeId)
        }
        .navigationTitle("Employee details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailScreen(employeeId: UUID())
}
