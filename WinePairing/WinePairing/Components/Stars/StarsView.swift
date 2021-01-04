//
//  StarsView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 04/01/21.
//

import UIKit

enum StarType {
    case fill
    case half
    case empty
}

class StarsView: UIStackView {
    private let kFillStarImageName = "star.fill"
    private let kHalfStarImageName = "star.lefthalf.fill"
    private let kEmptyStarImageName = "star.fill"
    
    func setup(with types: [StarType]) {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            
            self.clear()
            types.forEach { type in self.addArrangedSubview(UIImageView(image: self.star(for: type))) }
            self.setupAccessibility(with: types)
        }
    }
    
    private func clear() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    private func star(for type: StarType) -> UIImage? {
        var image: UIImage?
        let starImageName = imageName(for: type)
        let starColor = color(for: type)
        
        image = UIImage(systemName: starImageName, withConfiguration: UIImage.SymbolConfiguration(textStyle: .headline))
        image = image?.withTintColor(starColor, renderingMode: .alwaysOriginal)
        
        return image
    }
    
    private func imageName(for type: StarType) -> String {
        var imageName: String = ""
        
        switch type {
        case .fill:
            imageName = kFillStarImageName
        case .half:
            imageName = kHalfStarImageName
        case .empty:
            imageName = kEmptyStarImageName
        }
        
        return imageName
    }
    
    private func color(for type: StarType) -> UIColor {
        var imageColor: UIColor = .black
        
        switch type {
        case .fill:
            imageColor = Colors.filledStar
        case .half:
            imageColor = Colors.halfStar
        case .empty:
            imageColor = Colors.emptyStar
        }
        
        return imageColor
    }
    
    private func setupAccessibility(with types: [StarType]) {
        let fillStarsCount = types.filter { $0 == .fill }.count
        isAccessibilityElement = true
        accessibilityLabel = "\(fillStarsCount) out of five stars"
    }
}
