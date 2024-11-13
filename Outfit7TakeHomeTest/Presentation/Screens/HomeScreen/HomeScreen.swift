//
//  HomeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel = HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService())))
    
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.employees) { employee in
                    NavigationLink {
                        DetailScreen(employee: employee)
                    } label: {
                        HStack {
                            Text(employee.name)
                            Text(employee.lastName)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    viewModel.removeEmployee(at: indexSet)
                })
            }
            .animation(.default, value: viewModel.employees)
            .navigationTitle("Employees")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
            .fullScreenCover(isPresented: $isShowingSheet, content: {
                AddEmployeeScreen(viewModel: viewModel)
            })
        }
        .task {
            await viewModel.fetchEmployees()
        }
        
    }
}

#Preview {
    HomeScreen(viewModel: HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
