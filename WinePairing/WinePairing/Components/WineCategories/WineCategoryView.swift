//
//  WineCategoryView.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

final class WineCategoryView: UIView {
    
    // MARK: - Constants
    
    private let kMargin: CGFloat = 8
    
    // MARK: - Variables
    
    private(set) var viewModel: WineCategoryViewModel? {
        didSet {
            reloadData()
        }
    }
    
    // MARK: - Views
    
    lazy var collectionView: SelfSizingCollectionView = {
        let view = SelfSizingCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.clipsToBounds = false
        return view
    }()
    
    // MARK: - Life Cycle
    
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
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: kMargin).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -kMargin).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: kMargin).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -kMargin).isActive = true
    }
}
