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
    @State var isShovingStats: Bool = false
    
    var body: some View {
        NavigationStack {
            if viewModel.employees.isEmpty {
                ContentUnavailableView("Please add new employee", systemImage: "person.fill.badge.plus")
            }
            employeeList
                .navigationTitle("Employees")
                .toolbar(content: {
                    toolbarButtonEdit
                    toolbarButtonStatsAndPlus
                })
                .fullScreenCover(isPresented: $isShowingSheet, content: {
                    AddEmployeeScreen()
                })
        }
        .overlay {
            if isShovingStats {
                ModalView(isShowingStats: $isShovingStats, age: "Average age of the employees is: \(viewModel.getAverageAge())", percentage: viewModel.getGenderPercentage(), buttonTitle: "OK")
            }
        }
        .task {
            await viewModel.fetchEmployees()
        }
    }
}

extension HomeScreen {
    
    var employeeList: some View {
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
    }
    var toolbarButtonEdit: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            EditButton()
        }
    }
    var toolbarButtonStatsAndPlus: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack {
                Button("Stats") {
                    isShovingStats.toggle()
                }
                .disabled(viewModel.employees.isEmpty)
                Button(action: {
                    isShowingSheet.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
