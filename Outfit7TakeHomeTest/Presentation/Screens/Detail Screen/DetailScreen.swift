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
            ZStack {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                    HStack {
                        Text(employee.name)
                        Text(employee.lastName)
                    }
                    .font(.largeTitle)
                }
            }
            .frame(width: .infinity, height: 300)
            Spacer()
            Form(content: {
                Section("Personal info") {
                    VStack(alignment: .leading) {
                        Text("Age")
                            .font(.footnote)
                        Text("\(employee.age)")
                    }
                    
                    
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
    DetailScreen(employee: EmployeeDomainModel(id: UUID(), name: "Aleksandar", lastName: "Milidrag", age: 21, gender: .male))
}
