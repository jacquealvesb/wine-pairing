//
//  DetailsQuoteView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 11/01/21.
//

import UIKit

final class DetailsQuoteView: UIView {
    
    // MARK: - Constants
    
    private let kMargin: CGFloat = 16
    private let kCardCornerRadius: CGFloat = 40
    
    // MARK: - Views
    
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
        view.backgroundColor = Constants.Colors.quoteBackground
        view.applyRoundedCorner(radius: kCardCornerRadius)
        return view
    }()
    
    lazy var quotationMarkRight: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "\""
        view.textColor = Constants.Colors.quotationMark
        view.font = .italicSystemFont(ofSize: 70)
        view.isAccessibilityElement = false
        return view
    }()
    
    lazy var quotationMarkLeft: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "\""
        view.textColor = Constants.Colors.quotationMark
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
        let view = TextButton(text: "Close", color: Constants.Colors.textButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
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
        cardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: kMargin).isActive = true
        cardView.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -kMargin).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: kMargin).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -kMargin).isActive = true
        
        quotationMarkRight.topAnchor.constraint(equalTo: cardView.topAnchor, constant: kMargin).isActive = true
        quotationMarkRight.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: kMargin).isActive = true
        
        detailsLabel.topAnchor.constraint(equalTo: quotationMarkRight.bottomAnchor).isActive = true
        detailsLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: kMargin).isActive = true
        detailsLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -kMargin).isActive = true
        detailsLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: kMargin).isActive = true
        
        quotationMarkLeft.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor).isActive = true
        quotationMarkLeft.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -kMargin).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: quotationMarkLeft.bottomAnchor).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -kMargin).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: kMargin).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -kMargin).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
