//
//  HomeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel : HomeScreenViewModel
    
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.employees) { employee in
                    NavigationLink {
                        DetailScreen(employeeId: employee.id)
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
            .navigationTitle("Employees")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button("Show stats") {
                            
                        }
                        Button(action: {
                            isShowingSheet.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        })

                    }
                }
            })
            .fullScreenCover(isPresented: $isShowingSheet, content: {
                AddEmployeeScreen()
            })
        }
        .task {
            await viewModel.fetchEmployees()
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
