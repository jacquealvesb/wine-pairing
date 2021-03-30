//
//  Constants.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 03/02/21.
//

import UIKit

enum Constants {
    
    // MARK: - Colors
    
    struct Colors {
        static let averageRate: UIColor = UIColor(named: "average_rate") ?? .label
        static let background: UIColor = UIColor(named: "background") ?? .systemBackground
        static let quoteBackground: UIColor = UIColor(named: "background_quote") ?? .systemBackground
        static let button: UIColor = UIColor(named: "button_round") ?? .systemBlue
        static let textButton: UIColor = UIColor(named: "button_text") ?? .systemBlue
        static let errorPopUp: UIColor = UIColor(named: "error_popup") ?? .systemRed
        static let quotationMark: UIColor = UIColor(named: "quotation_mark") ?? .label
        static let emptyStar: UIColor = UIColor(named: "star_empty") ?? .tertiarySystemBackground
        static let filledStar: UIColor = UIColor(named: "star_fill") ?? .secondarySystemBackground
        static let halfStar: UIColor = UIColor(named: "star_half") ?? .secondarySystemBackground
        static let wineCategory: UIColor = UIColor(named: "wine_category") ?? .systemBlue
    }
    
    // MARK: - Images
    
    struct Images {
        static let downArrow: String = "chevron.compact.down"
        static let share: String = "square.and.arrow.up"
        static let fillStar: String = "star.fill"
        static let halfStar: String = "star.lefthalf.fill"
        static let emptyStar: String = "star.fill"
        static let winePlaceholder: String = "wine_placeholder"
    }
}
