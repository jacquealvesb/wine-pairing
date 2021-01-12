//
//  MainView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 10/12/20.
//


// swiftlint:disable all

import UIKit

final class MainView: UIView {
    lazy var details: DetailsQuoteView = {
        let view = DetailsQuoteView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        details.detailsLabel.text = "Merlot, Cabernet Sauvignon, and Pinot Noir are my top picks for Steak. After all, beef and red wine are a classic combination. Generally, leaner steaks go well with light or medium-bodied reds, such as pinot noir or merlot, while fattier steaks can handle a bold red, such as cabernet sauvingnon. The Sterling Vineyards Merlot with a 5 out of 5 star rating seems like a good match. It costs about 29 dollars per bottle."
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView: ViewCode {
    func buildViewHierarchy() {
        addSubview(details)
    }
    
    func setupConstraints() {
        details.topAnchor.constraint(equalTo: topAnchor).isActive = true
        details.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        details.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        details.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .systemBackground
    }
}
