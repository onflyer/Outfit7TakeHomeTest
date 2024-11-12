//
//  AddEmployeeScreen.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import SwiftUI

struct AddEmployeeScreen: View {
    
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var age: Int = 0
    @State private var gender: Gender = .unknown
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Info") {
                    TextField("Enter employee's name", text: $name)
                    TextField("Enter employee's last name", text: $lastName)
                    TextField("Enter employee's age", value: $age, formatter: formatter)
                        .keyboardType(.numberPad)
                    Picker("Gender", selection: $gender) {
                        ForEach(Gender.allCases) { gender in
                            Text(gender.rawValue)
                        }
                    }
                }
            }
            .navigationTitle("Add employee")
        }
    }
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.zeroSymbol = ""
        return formatter
    }()
}

#Preview {
    AddEmployeeScreen()
}
