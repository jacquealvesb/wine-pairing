//
//  PairingResultsView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 13/01/21.
//

import UIKit

final class PairingResultsView: UIView {
    
    // MARK: - Variables
    
    private var viewModel: PairingResultsViewModel? {
        didSet {
            setupTopPicks()
            setupSuggestions()
        }
    }
    
    // MARK: - Views
    
    lazy var topPicksHeadline: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.text = "Top Picks"
        view.accessibilityTraits = .header
        return view
    }()
    
    lazy var wineCategories: WineCategoryView = {
        let view = WineCategoryView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var moreDetailsButton: TextButton = {
        let view = TextButton(text: "More Details", color: Colors.quotationMark)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityUserInputLabels = ["More Details", "Details"]
        return view
    }()
    
    lazy var suggestionsHeadline: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.text = "Suggestions"
        view.accessibilityTraits = .header
        return view
    }()
    
    lazy var suggestionsList: WineSuggestionsView = {
        let view = WineSuggestionsView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        accessibilityElements = [topPicksHeadline, wineCategories, moreDetailsButton, suggestionsHeadline, suggestionsList]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    func setup(with viewModel: PairingResultsViewModel?) {
        self.viewModel = viewModel
    }
    
    private func setupTopPicks() {
        guard let viewModel = viewModel else { return }
        wineCategories.setup(with: viewModel.topPicksViewModel())
    }
    
    private func setupSuggestions() {
        guard let viewModel = viewModel else { return }
        suggestionsList.setup(with: viewModel.suggestionsViewModel())
    }
}

extension PairingResultsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(topPicksHeadline)
        addSubview(wineCategories)
        addSubview(moreDetailsButton)
        addSubview(suggestionsHeadline)
        addSubview(suggestionsList)
    }
    
    func setupConstraints() {
        topPicksHeadline.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        topPicksHeadline.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        topPicksHeadline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        wineCategories.topAnchor.constraint(equalTo: topPicksHeadline.bottomAnchor, constant: 8).isActive = true
        wineCategories.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        wineCategories.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        wineCategories.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        moreDetailsButton.topAnchor.constraint(equalTo: wineCategories.bottomAnchor, constant: 16).isActive = true
        moreDetailsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        suggestionsHeadline.topAnchor.constraint(equalTo: moreDetailsButton.bottomAnchor, constant: 24).isActive = true
        suggestionsHeadline.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        suggestionsHeadline.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        suggestionsList.topAnchor.constraint(equalTo: suggestionsHeadline.bottomAnchor, constant: 8).isActive = true
        suggestionsList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        suggestionsList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        suggestionsList.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
