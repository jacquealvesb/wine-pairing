//
//  WineCategoryView+DelegateAndDataSource.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

extension WineCategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.categoriesCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel?.viewModel(for: indexPath),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WineCategoryCellView.reuseIdentifier,
                                                            for: indexPath) as? WineCategoryCellView else {
            fatalError("Could not create cell")
        }
        
        cell.setup(with: viewModel)
        
        return cell
    }
}

extension WineCategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let viewModel = viewModel?.viewModel(for: indexPath) else {
            fatalError("Could not find view model")
        }

        return viewModel.size(with: .systemFont(ofSize: UIFont.labelFontSize, weight: .regular))
    }
}
