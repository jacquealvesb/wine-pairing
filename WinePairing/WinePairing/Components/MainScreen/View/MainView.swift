//
//  MainView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 10/12/20.
//

import UIKit

final class MainView: UIView {
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello, you!"
        view.font = .preferredFont(forTextStyle: .body)
        return view
    }()
    
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
        addSubview(label)
    }
    
    func setupConstraints() {
        label.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .systemBackground
    }
}
