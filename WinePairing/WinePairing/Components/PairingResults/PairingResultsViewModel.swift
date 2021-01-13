//
//  PairingResultsViewModel.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 13/01/21.
//

import Foundation

final class PairingResultsViewModel {
    private let topPicks: [String]
    private let suggestions: [Wine]
    
    init(topPicks: [String], suggestions: [Wine]) {
        self.topPicks = topPicks
        self.suggestions = suggestions
    }
    
    func topPicksViewModel() -> WineCategoryViewModel {
        return WineCategoryViewModel(categories: topPicks)
    }
    
    func suggestionsViewModel() -> WineSuggestionsViewModel {
        return WineSuggestionsViewModel(wines: suggestions)
    }
}
