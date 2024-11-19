//
//  HomeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel : EmployeesRepository
    
    @State private var isShowingSheet: Bool = false
    @State private var isShovingStats: Bool = false
    @State private var isSearching: Bool = false
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            if viewModel.employees.isEmpty {
                ContentUnavailableView("Please add new employee", systemImage: "person.fill.badge.plus")
            }
            employeeList
                .overlay {
                    if isSearching {
                        searchedEmployeesList
                    }
                }
                .navigationTitle("Employees")
                .toolbar(content: {
                    toolbarButtonEdit
                    toolbarButtonStatsAndPlus
                })
                .fullScreenCover(isPresented: $isShowingSheet, content: {
                    AddEmployeeScreen()
                })
                .searchable(text: $searchText, prompt: "Type to search employees")
        }
        .overlay {
            if isShovingStats {
                ModalView(isShowingStats: $isShovingStats, age: "Average age of the employees is: \(viewModel.getAverageAge())", percentage: viewModel.getGenderPercentage(), buttonTitle: "OK")
            }
        }
        .task(id: searchText, {
            isSearching = !searchText.isEmpty ? true : false
        })
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
                    listRowImage
                    Text(fullName(name: employee.name, lastName: employee.lastName))
                }
            }
            .onDelete(perform: { indexSet in
                viewModel.removeEmployee(at: indexSet)
            })
        }
    }
    
    var searchedEmployeesList: some View {
        List {
            ForEach(searchedEmployees) { employee in
                NavigationLink {
                    DetailScreen(employeeId: employee.id)
                } label: {
                    listRowImage
                    Text(fullName(name: employee.name, lastName: employee.lastName))
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
    
    var listRowImage: some View {
        HStack(spacing: 15) {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.gray)
                .frame(width: 30, height: 30)
        }
    }
    
    var searchedEmployees: [EmployeeDomainModel] {
        return viewModel.employees.filter { employee in
            employee.name.localizedStandardContains(searchText) || employee.lastName.localizedStandardContains(searchText)
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
    HomeScreen()
        .environmentObject(EmployeesRepository(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
