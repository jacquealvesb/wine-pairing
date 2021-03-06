//
//  WineCategoryCellView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

final class WineCategoryCellView: UICollectionViewCell {
    
    // MARK: - Constants
    
    static let reuseIdentifier: String = "WineCategoryCellView"
    private let kMargin: CGFloat = 8
    
    // MARK: - Variables
    
    private var viewModel: WineCategoryCellViewModel? {
        didSet {
            setText(viewModel?.category)
            setColor(viewModel?.color)
        }
    }
    
    // MARK: - Views
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: UIFont.labelFontSize, weight: .regular)
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLargeContentViewer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setup(with viewModel: WineCategoryCellViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupLargeContentViewer() {
        showsLargeContentViewer = true
        addInteraction(UILargeContentViewerInteraction())
    }
    
    private func setColor(_ colorName: String?) {
        guard let colorName = colorName else { return }
        backgroundColor = UIColor(named: colorName) ?? .black
    }
    
    private func setText(_ text: String?) {
        label.text = text?.capitalized
        largeContentTitle = text?.capitalized
    }
}

// MARK: - View Code

extension WineCategoryCellView: ViewCode {
    func buildViewHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {
        label.topAnchor.constraint(equalTo: topAnchor, constant: kMargin).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -kMargin).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: kMargin).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -kMargin).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        applyRoundedCorner(radius: 18)
        applyShadow()
    }
}
