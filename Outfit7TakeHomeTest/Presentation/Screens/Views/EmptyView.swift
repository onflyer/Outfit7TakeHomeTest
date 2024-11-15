//
//  EmptyView.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 15. 11. 2024..
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ContentUnavailableView("Please add new employee", systemImage: "person.fill.badge.plus")
    }
}

#Preview {
    EmptyView()
}
