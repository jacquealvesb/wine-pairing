//
//  WineCellViewModel.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import Foundation

final class WineCellViewModel {
    private let wine: Wine
    
    var title: String {
        return wine.title
    }
    
    var averageRating: String {
        return "\(ceil(wine.averageRating / 0.5) * 0.5)"
    }
    
    var stars: [StarType] {
        let fullStars = floor(wine.averageRating)
        let halfStar = wine.averageRating - fullStars
        
        var starsImages = Array(repeating: StarType.fill, count: Int(fullStars))
        if halfStar > 0 {
            starsImages.append(StarType.half)
        }
        if starsImages.count < 5 {
            starsImages.append(contentsOf: Array(repeating: StarType.empty, count: 5 - starsImages.count))
        }
        
        return starsImages
    }
    
    var ratingCount: String {
        return "\(wine.ratingCount) \(wine.ratingCount > 1 ? "rates" : "rate")"
    }
    
    var imageURL: URL? {
        return URL(string: wine.imageURL)
    }
    
    var accessibilityLabel: String {
        return "\(wine.title). \(averageRating) out of five stars. \(ratingCount)."
    }
    
    init(wine: Wine) {
        self.wine = wine
    }
}
