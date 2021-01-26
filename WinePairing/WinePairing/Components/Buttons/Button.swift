//
//  Button.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 15/01/21.
//

import UIKit

class Button: UIButton {
    
    // MARK: - Variables
    
    var action: (() -> Void)?
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLargeContentViewer()
        setupTouchAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupLargeContentViewer() {
        showsLargeContentViewer = true
        addInteraction(UILargeContentViewerInteraction())
    }
    
    private func setupTouchAction() {
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func tapped() {
        action?()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        FeedbackManager.button()
    }
}
