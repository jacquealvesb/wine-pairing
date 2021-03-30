//
//  TextButton.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 12/01/21.
//

import UIKit

final class TextButton: Button {
    
    // MARK: - Constants
    
    private let kMinWidth: CGFloat = 44
    private let kMinHeight: CGFloat = 44
    
    // MARK: - Life Cycle
    
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
        widthAnchor.constraint(greaterThanOrEqualToConstant: kMinWidth).isActive = true
        heightAnchor.constraint(greaterThanOrEqualToConstant: kMinHeight).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
