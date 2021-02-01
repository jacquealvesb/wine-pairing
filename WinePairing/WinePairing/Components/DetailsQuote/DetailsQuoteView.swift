//
//  DetailsQuoteView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 11/01/21.
//

import UIKit

final class DetailsQuoteView: UIView {
    
    // MARK: - Variables
    
    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .prominent)
        let view = UIVisualEffectView(effect: blurEffect)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    lazy var cardView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isAccessibilityElement = false
        view.backgroundColor = Colors.quoteBackground
        view.layer.cornerRadius = 40
        return view
    }()
    
    lazy var quotationMarkRight: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "\""
        view.textColor = Colors.quotationMark
        view.font = .italicSystemFont(ofSize: 70)
        view.isAccessibilityElement = false
        return view
    }()
    
    lazy var quotationMarkLeft: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "\""
        view.textColor = Colors.quotationMark
        view.font = .italicSystemFont(ofSize: 70)
        view.isAccessibilityElement = false
        return view
    }()
    
    lazy var detailsLabel: UITextView = {
        let view = UITextView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.textAlignment = .center
        view.backgroundColor = .clear
        view.isEditable = false
        view.accessibilityUserInputLabels = [""]
        view.accessibilityTraits = .staticText
        return view
    }()
    
    lazy var closeButton: TextButton = {
        let view = TextButton(text: "Close", color: Colors.quotationMark)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    func setup(with text: String) {
        detailsLabel.text = text
    }
}

// MARK: - View Code

extension DetailsQuoteView: ViewCode {
    func buildViewHierarchy() {
        addSubview(blurEffectView)
        addSubview(cardView)
        cardView.addSubview(quotationMarkLeft)
        cardView.addSubview(detailsLabel)
        cardView.addSubview(quotationMarkRight)
        cardView.addSubview(closeButton)
    }
    
    func setupConstraints() {
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        cardView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        quotationMarkRight.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        quotationMarkRight.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        
        detailsLabel.topAnchor.constraint(equalTo: quotationMarkRight.bottomAnchor).isActive = true
        detailsLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        detailsLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16).isActive = true
        detailsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 10).isActive = true
        
        quotationMarkLeft.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16).isActive = true
        quotationMarkLeft.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor).isActive = true
        
        closeButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16).isActive = true
        closeButton.topAnchor.constraint(equalTo: quotationMarkLeft.bottomAnchor, constant: 8).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -24).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
