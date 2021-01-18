//
//  PairingResultsViewModel.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 13/01/21.
//

import Foundation

final class PairingResultsViewModel {
    private let winePairing: WinePairing
    
    init(winePairing: WinePairing) {
        self.winePairing = winePairing
    }
    
    func topPicksViewModel() -> WineCategoryViewModel {
        return WineCategoryViewModel(categories: winePairing.categories)
    }
    
    func suggestionsViewModel() -> WineSuggestionsViewModel {
        return WineSuggestionsViewModel(wines: winePairing.topPicks)
    }
    
    func pairingDetails() -> String {
        return winePairing.text
    }
}
