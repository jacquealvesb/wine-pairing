//
//  MainView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 10/12/20.
//

import UIKit
import AMPopTip

final class MainView: UIView {
    
    // MARK: - Views
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "What are you eating?"
        view.textAlignment = .center
        view.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: .systemFont(ofSize: UIFont.buttonFontSize*2, weight: .bold))
        view.adjustsFontForContentSizeCategory = true
        view.numberOfLines = 0
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Steak"
        view.accessibilityHint = "Enter a food to find out a pairing wine"
        view.searchBarStyle = .minimal
        view.autocorrectionType = .default
        return view
    }()
    
    lazy var errorPopUp: PopTip = {
        let view = PopTip()
        view.shouldDismissOnTap = true
        view.bubbleColor = Colors.errorPopUp
        view.accessibilityUserInputLabels = [""]
        view.isAccessibilityElement = true
        view.shouldGroupAccessibilityChildren = true
        return view
    }()
    
    lazy var pairButton: RoundButton = {
        let view = RoundButton(text: "Pair With Wine", color: Colors.button)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityUserInputLabels = ["Pair", "Pair With Wine"]
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        setupErrorPopUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Error
    
    private func setupErrorPopUp() {
        errorPopUp.entranceAnimation = UIAccessibility.isReduceMotionEnabled ? .none : .scale
        errorPopUp.exitAnimation = UIAccessibility.isReduceMotionEnabled ? .none : .scale
        errorPopUp.dismissHandler = { [weak self] _ in
            guard let `self` = self else { return }
            UIAccessibility.post(notification: .layoutChanged, argument: self.searchBar)
        }
    }
    
    func showError() {
        FeedbackManager.error()
        
        errorPopUp.show(text: "Please fill the search field with what you are eating",
                        direction: .up,
                        maxWidth: frame.width/2,
                        in: self,
                        from: searchBar.frame,
                        duration: UIAccessibility.isVoiceOverRunning ? nil : 2)
        errorPopUp.accessibilityLabel?.append(". Double-tap to dismiss")
        UIAccessibility.post(notification: .layoutChanged, argument: errorPopUp)
    }
}

extension MainView: ViewCode {
    func buildViewHierarchy() {
        addSubview(searchBar)
        addSubview(label)
        addSubview(pairButton)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        searchBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        label.bottomAnchor.constraint(equalTo: searchBar.topAnchor).isActive = true
        
        pairButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pairButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8).isActive = true
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: pairButton.bottomAnchor, constant: 8).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.background
    }
}
