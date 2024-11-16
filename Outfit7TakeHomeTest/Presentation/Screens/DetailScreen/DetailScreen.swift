//
//  DetailScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct DetailScreen: View {
    
    @EnvironmentObject var viewModel: HomeScreenViewModel
    @State private var isShowingEdit: Bool = false
    
    let employeeId: UUID
    
    var body: some View {
        VStack {
            header
            Spacer()
            form
        }
        .sheet(isPresented: $isShowingEdit, onDismiss: {
            viewModel.getEmployee(id: employeeId)
        } , content: {
            EditEmployeeScreen(id: employeeId)
        })
        .toolbar {
            toolbarButtonDone
        }
        .task {
            viewModel.getEmployee(id: employeeId)
        }
        .navigationTitle("Employee details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension DetailScreen {
    
    var header: some View {
        ZStack {
            VStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.tertiary)
                    .padding(30)
                HStack {
                    Text(fullName(name: viewModel.name, lastName: viewModel.lastName))
                }
                .font(.largeTitle)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
    }
    
    var form: some View {
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
    
    var toolbarButtonDone: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button("Edit") {
                isShowingEdit.toggle()
            }
        }
    }
    
    func fullName(name: String, lastName: String) -> String {
        let formatter = PersonNameComponentsFormatter()
        var components = PersonNameComponents()
        components.givenName = name
        components.familyName = lastName
        return formatter.string(from: components)
    }
}

#Preview {
    DetailScreen(employeeId: UUID())
        .environmentObject(HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
