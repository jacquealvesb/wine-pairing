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
    
    var viewModel: WineCategoryCellViewModel? {
        didSet {
            setText(viewModel?.category)
            setColor(viewModel?.color)
        }
    }
    
    // MARK: - Views
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .body)
        view.textColor = .white
        view.textAlignment = .center
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
    
    // MARK: - Setup
    
    func setup(with viewModel: WineCategoryCellViewModel) {
        self.viewModel = viewModel
    }
    
    private func setColor(_ colorName: String?) {
        guard let colorName = colorName else { return }
        backgroundColor = UIColor(named: colorName) ?? .black
    }
    
    private func setText(_ text: String?) {
        label.text = text
    }
}

// MARK: - View Code

extension WineCategoryCellView: ViewCode {
    func buildViewHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        layer.cornerRadius = 18
    }
}
