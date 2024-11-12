//
//  ViewState.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 12. 11. 2024..
//

import Foundation

enum ViewState: Equatable {
    case idle
    case loading
    case empty
    case success
    case error(String)
}
