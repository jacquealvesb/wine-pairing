//
//  WineSuggestionsViewModel.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import Foundation

final class WineSuggestionsViewModel {
    private let wines: [Wine]
    
    var winesCount: Int {
        return wines.count
    }
    
    init(wines: [Wine]) {
        self.wines = wines
    }
    
    func viewModel(for indexPath: IndexPath) -> WineCellViewModel? {
        guard indexPath.row < winesCount else { return nil }
        return WineCellViewModel(wine: wines[indexPath.row])
    }
    
    func shareWine(at indexPath: IndexPath) {
        guard indexPath.row < winesCount else { return }
        NotificationCenter.default.post(name: Notification.Name("shareWine"), object: wines[indexPath.row])
    }
}
