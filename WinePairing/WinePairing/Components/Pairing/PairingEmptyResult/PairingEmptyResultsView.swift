//
//  PairingEmptyResultsView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 15/01/21.
//

import UIKit

final class PairingEmptyResultsView: UIView {
    
    // MARK: - Views
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.font = .preferredFont(forTextStyle: .body)
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - Variables
    
    private var searchedText: String {
        didSet {
            updateLabel(with: searchedText)
        }
    }
    
    // MARK: - Life cycle
    
    init(searchedText: String) {
        self.searchedText = searchedText
        super.init(frame: .zero)
        
        setupView()
        updateLabel(with: searchedText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateLabel(with text: String) {
        self.label.text = "Sorry, we didn't find any wine to pair with \"\(text)\".\nMaybe try something else."
    }
}

extension PairingEmptyResultsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
