//
//  TextButton.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 12/01/21.
//

import UIKit

final class TextButton: Button {
    
    // MARK: - Life cycle
    
    init(text: String, color: UIColor, action: (() -> Void)? = nil) {
        super.init(frame: .zero)
        
        self.action = action
        
        setupView()
        setupText(text, withColor: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupText(_ text: String, withColor color: UIColor) {
        let normalAttributes: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                               .foregroundColor: color]
        let touchedAttributes: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                                .foregroundColor: color.withAlphaComponent(0.5)]
        
        let normalAttributeString = NSMutableAttributedString(string: text, attributes: normalAttributes)
        let touchedAttributeString = NSMutableAttributedString(string: text, attributes: touchedAttributes)
        
        setAttributedTitle(normalAttributeString, for: .normal)
        setAttributedTitle(touchedAttributeString, for: .disabled)
        setAttributedTitle(touchedAttributeString, for: .highlighted)
    }
}

// MARK: - View Code

extension TextButton: ViewCode {
    func buildViewHierarchy() {}
    
    func setupConstraints() {
        heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
        widthAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
