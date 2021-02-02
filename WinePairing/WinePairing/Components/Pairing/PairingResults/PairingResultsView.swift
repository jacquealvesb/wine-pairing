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
    
    weak var delegate: PairingViewDelegate? {
        didSet {
            setupMoreDetailsButton()
        }
    }
    
    // MARK: - Views
    
    lazy var topPicksHeadline: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.adjustsFontForContentSizeCategory = true
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
        let view = TextButton(text: "More Details", color: Colors.textButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityUserInputLabels = ["More Details", "Details"]
        view.accessibilityHint = "Double tap to open"
        return view
    }()
    
    lazy var suggestionsHeadline: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.adjustsFontForContentSizeCategory = true
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
    
    init(with viewModel: PairingResultsViewModel?, delegate: PairingViewDelegate?) {
        super.init(frame: .zero)
                
        defer {
            self.viewModel = viewModel
            self.delegate = delegate
        }
        
        setupView()
        setupNotifications()
        setupAcessibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    private func setupAcessibility() {
        accessibilityElements = [topPicksHeadline, wineCategories, moreDetailsButton, suggestionsHeadline, suggestionsList]
    }
    
    private func setupTopPicks() {
        guard let viewModel = viewModel else { return }
        wineCategories.setup(with: viewModel.topPicksViewModel())
    }
    
    private func setupSuggestions() {
        guard let viewModel = viewModel else { return }
        suggestionsList.setup(with: viewModel.suggestionsViewModel())
    }
    
    private func setupMoreDetailsButton() {
        moreDetailsButton.action = { [weak self, delegate] in
            guard let `self` = self, let delegate = delegate else { return }
            delegate.didClickMoreDetailsButton(text: self.viewModel?.pairingDetails())
        }
    }
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(focusMoreDetailsButton),
                                               name: Notification.Name("didDismissMoreDetails"),
                                               object: nil)
    }
    
    // MARK: - Notifications
    
    @objc private func focusMoreDetailsButton() {
        UIAccessibility.post(notification: .layoutChanged, argument: moreDetailsButton)
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
        topPicksHeadline.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topPicksHeadline.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        wineCategories.topAnchor.constraint(equalTo: topPicksHeadline.bottomAnchor, constant: 8).isActive = true
        wineCategories.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        wineCategories.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        moreDetailsButton.topAnchor.constraint(equalTo: wineCategories.bottomAnchor, constant: 16).isActive = true
        moreDetailsButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        suggestionsHeadline.topAnchor.constraint(equalTo: moreDetailsButton.bottomAnchor, constant: 24).isActive = true
        suggestionsHeadline.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        suggestionsHeadline.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        suggestionsList.topAnchor.constraint(equalTo: suggestionsHeadline.bottomAnchor, constant: 8).isActive = true
        suggestionsList.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        suggestionsList.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        suggestionsList.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
