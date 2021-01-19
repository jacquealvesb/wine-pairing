//
//  MainView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 10/12/20.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - Views
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "What are you eating?"
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "Steak"
        view.accessibilityHint = "Enter a food to find out a pairing wine"
        view.searchBarStyle = .minimal
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        searchBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: searchBar.topAnchor).isActive = true
        
        pairButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pairButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8).isActive = true
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: pairButton.bottomAnchor, constant: 8).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.quoteBackground
    }
}
