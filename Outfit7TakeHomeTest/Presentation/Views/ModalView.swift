//
//  ModalView.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 15. 11. 2024..
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject var viewModel: HomeScreenViewModel
    
    @Binding var isShowing: Bool
    
    @State private var averageAge: Double = 0
    @State private var malePercentage: Int = 0
    @State private var femalePercentage: Int = 0
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading,spacing: 10) {
                Text("Average age of the employees is: \(averageAge, specifier: "%.1f")")
                Text("Male to Female percentage is: \(malePercentage) to \(femalePercentage) %")
            }
            .frame(maxWidth: .infinity, maxHeight: 300, alignment: .leading)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.4))
       
    }
}

#Preview {
    ModalView(isShowing: .constant(true))
        .environmentObject(HomeScreenViewModel(repository: EmployeesLocalRepository(dataSource: LocalEmployeeDataSource(coreDataService: CoreDataService()))))
}
