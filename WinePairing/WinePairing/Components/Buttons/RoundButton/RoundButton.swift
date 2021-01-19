//
//  RoundButton.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 11/12/20.
//

import UIKit

final class RoundButton: Button {
    
    // MARK: - Variables
    
    var text: String
    var color: UIColor
    
    override var isEnabled: Bool {
        didSet {
            setBackgroundColor(for: isEnabled ? .normal : .disabled)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            setBackgroundColor(for: isHighlighted ? .highlighted : .normal)
        }
    }
    
    // MARK: - Life cycle
    
    init(text: String, color: UIColor, action: (() -> Void)? = nil) {
        self.text = text
        self.color = color
        
        super.init(frame: .zero)
        
        self.action = action

        setupView()
        setupText(text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupText(_ text: String) {
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        
        setTitle(text, for: .normal)
        
        sizeToFit()
        
        setTitleColor(.white, for: .normal)
        setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .disabled)
        setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)
    }

    func setBackgroundColor(for state: UIControl.State) {
        switch state {
        case .normal:
            backgroundColor = color
        case .disabled:
            backgroundColor = color.withAlphaComponent(0.5)
        case .highlighted:
            backgroundColor = color.withAlphaComponent(0.5)
        default:
            backgroundColor = color
        }
    }
}

// MARK: - View Code

extension RoundButton: ViewCode {
    func buildViewHierarchy() {}
    
    func setupConstraints() {
        heightAnchor.constraint(greaterThanOrEqualToConstant: 44.0).isActive = true
        widthAnchor.constraint(lessThanOrEqualToConstant: 210.0).isActive = true
        widthAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = color
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layer.cornerRadius = 22
    }
}
