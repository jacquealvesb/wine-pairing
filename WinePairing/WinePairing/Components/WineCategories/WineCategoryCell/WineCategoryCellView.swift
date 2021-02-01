//
//  WineCategoryCellView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

final class WineCategoryCellView: UICollectionViewCell {
    
    // MARK: - Constants
    
    static let reuseIdentifier = "WineCategoryCellView"
    
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
        label.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        layer.cornerRadius = 18
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}
