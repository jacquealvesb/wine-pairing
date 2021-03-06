//
//  PairingView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 15/01/21.
//

import UIKit

final class PairingView: UIView {
    
    // MARK: - Constants
    
    private let kMargin: CGFloat = 16
    private let kMinWidth: CGFloat = 44
    private let kMinHeight: CGFloat = 44
    
    // MARK: - Variables
    
    private var viewModel: PairingViewModel? {
        didSet {
            setupContentView(with: viewModel?.state)
        }
    }
    
    weak var delegate: PairingViewDelegate? {
        didSet {
            setupCloseButton()
        }
    }
    
    // MARK: - Views
    
    lazy var closeButton: Button = {
        let view = Button(frame: .zero)
        let image = UIImage(systemName: Constants.Images.downArrow,
                            withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?
            .withTintColor(Constants.Colors.button, renderingMode: .alwaysOriginal)

        view.contentVerticalAlignment = .fill
        view.contentHorizontalAlignment = .fill
        view.setImage(image, for: .normal)
        view.imageView?.contentMode = .scaleAspectFit
        view.accessibilityLabel = "Close"
        view.translatesAutoresizingMaskIntoConstraints = false

        view.applyShadow()
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        accessibilityElements = [contentView, closeButton]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    func setup(with viewModel: PairingViewModel, delegate: PairingViewDelegate? = nil) {
        self.delegate = delegate
        self.viewModel = viewModel
    }
    
    private func setupContentView(with state: PairingViewState?) {
        guard let state = state else { return }
        let content = contentViewFor(state: state)
        
        contentView.addSubview(content)
        
        content.translatesAutoresizingMaskIntoConstraints = false
        content.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func contentViewFor(state: PairingViewState) -> UIView {
        var contentView: UIView
        
        switch state {
        case .empty(let searchedText):
            contentView = PairingEmptyResultsView(searchedText: searchedText)
        case .pairing(let winePairing):
            contentView = PairingResultsView(with: PairingResultsViewModel(winePairing: winePairing), delegate: delegate)
        }
        
        return contentView
    }
    
    private func setupCloseButton() {
        closeButton.action = { [delegate] in
            guard let delegate = delegate else { return }
            delegate.didClickCloseButton()
        }
    }
}

// MARK: - View Code

extension PairingView: ViewCode {
    func buildViewHierarchy() {
        addSubview(closeButton)
        addSubview(contentView)
    }
    
    func setupConstraints() {
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: kMargin).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: kMinWidth).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: kMinHeight).isActive = true
        closeButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: kMargin).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: kMargin).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -kMargin).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Constants.Colors.background
    }
}
