//
//  DetailScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct DetailScreen: View {
    
    let employee: EmployeeDomainModel
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            ZStack {
               
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    
                   
                .padding(40)
            }
            .frame(width: .infinity, height: 300)
            Spacer()
            Form(content: {
                Section("Personal info") {
                    TextField("Enter name", text: $name)
                }
                
            })
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
