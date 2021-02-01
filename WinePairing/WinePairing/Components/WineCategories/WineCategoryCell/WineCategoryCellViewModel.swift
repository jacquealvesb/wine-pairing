//
//  WineCategoryCellViewModel.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

final class WineCategoryCellViewModel {
    let category: String
    let color: String = "wineCategoryColor"
    
    init(category: String) {
        self.category = category
    }
}
