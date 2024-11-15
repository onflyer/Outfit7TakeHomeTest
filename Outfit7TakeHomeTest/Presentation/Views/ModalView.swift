//
//  ModalView.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 15. 11. 2024..
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject var viewModel: HomeScreenViewModel
    
    var body: some View {
            ZStack {
                VStack(alignment: .leading,spacing: 10) {
                    Text("Average age of the employees is: \(viewModel.getAverageAge(), specifier: "%.1f")")
                    Text(viewModel.getGenderPercentage())
                }
                .frame(maxWidth: .infinity, maxHeight: 300, alignment: .leading)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThinMaterial)
           
        }
}

#Preview {
    ModalView()
        .environmentObject(HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
