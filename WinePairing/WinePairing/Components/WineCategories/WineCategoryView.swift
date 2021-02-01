//
//  WineCategoryView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

final class WineCategoryView: UIView {
    
    // MARK: - Variables
    
    private(set) var viewModel: WineCategoryViewModel? {
        didSet {
            reloadData()
        }
    }
    
    // MARK: - Viewa
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.clipsToBounds = false
        return view
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(WineCategoryCellView.self,
                                forCellWithReuseIdentifier: WineCategoryCellView.reuseIdentifier)
        
        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    func setup(with viewModel: WineCategoryViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Collection View
    
    private func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.collectionView.reloadData()
        }
    }
}

// MARK: - View Code

extension WineCategoryView: ViewCode {
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
}
