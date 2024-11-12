//
//  DetailScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct DetailScreen: View {
    
    let employee: EmployeeDomainModel
    
    var body: some View {
        VStack {
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    
                }
            }
        }
        .navigationTitle("Employee details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailScreen(employee: EmployeeDomainModel(id: UUID(), name: "PreviewName", lastName: "PreviewLastName", age: 21, gender: .male))
}
