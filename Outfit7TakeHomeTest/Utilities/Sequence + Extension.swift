//
//  Sequence + Extension.swift
//  Outfit7TakeHomeTest
//
//  Created by Aleksandar Milidrag on 15. 11. 2024..
//

import Foundation

extension Sequence where Element: AdditiveArithmetic {
    /// Returns the total sum of all elements in the sequence
    func sum() -> Element { reduce(.zero, +) }
}
