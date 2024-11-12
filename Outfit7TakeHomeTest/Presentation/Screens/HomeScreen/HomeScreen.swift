//
//  HomeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeScreenViewModel
    @State var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.employees) { employee in
                    NavigationLink {
                        DetailScreen(employee: employee)
                    } label: {
                        Text(employee.name)
                    }


                }
            }
            .navigationTitle("Employees")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
            .sheet(isPresented: $isShowingSheet, content: {
                
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
