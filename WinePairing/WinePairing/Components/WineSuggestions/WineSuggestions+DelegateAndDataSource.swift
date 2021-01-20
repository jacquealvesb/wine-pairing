//
//  WineSuggestions+DelegateAndDataSource.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

extension WineSuggestionsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.winesCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel?.viewModel(for: indexPath),
              let cell = tableView.dequeueReusableCell(withIdentifier: WineCellView.reuseIdentifier,
                                                       for: indexPath) as? WineCellView else {
            fatalError("Could not create cell")
        }
        
        cell.setup(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let shareAction = UIContextualAction(style: .normal, title: "Share") { [weak self, indexPath] (_, _, completion) in
            guard let `self` = self else { return }
            self.shareItem(at: indexPath)
            completion(true)
        }
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        return UISwipeActionsConfiguration(actions: [shareAction])
    }
}
