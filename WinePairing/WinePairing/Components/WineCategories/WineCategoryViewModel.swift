//
//  WineCategoryViewModel.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import Foundation

final class WineCategoryViewModel {
    private let categories: [String]
    
    var categoriesCount: Int {
        return categories.count
    }
    
    init(categories: [String]) {
        self.categories = categories
    }
    
    func viewModel(for indexPath: IndexPath) -> WineCategoryCellViewModel? {
        guard indexPath.row < categoriesCount else { return nil }
        return WineCategoryCellViewModel(category: categories[indexPath.row])
    }
}
