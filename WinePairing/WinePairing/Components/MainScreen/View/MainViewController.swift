//
//  ViewController.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 10/12/20.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Views
    
    let contentView = MainView(frame: UIScreen.main.bounds)
    
    // MARK: - Variables
    
    var dataProvider: DataProvidable?
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataProvider()
        setupSearchButton()
        setupSeachBar()
    }
    
    // MARK: - Setups
    
    private func setupDataProvider() {
        dataProvider = DataProvider(service: AlmofireService.shared, apiKey: kSpoonacularApiKey)
    }
    
    private func setupSearchButton() {
        contentView.pairButton.action = { [weak self] in
            guard let `self` = self else { return }
            self.searchWinePairing(with: self.contentView.searchBar.text)
        }
    }
    
    private func setupSeachBar() {
        contentView.searchBar.delegate = self
    }
    
    // MARK: - Functions
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        view.endEditing(true)
    }
    
    private func searchWinePairing(with food: String?) {
        guard let food = food?.trimmingCharacters(in: .whitespacesAndNewlines), !food.isEmpty else {
            self.contentView.showError()
            return
        }
        
        view.endEditing(true)
        contentView.activityIndicator.startAnimating()
        UIAccessibility.post(notification: .layoutChanged, argument: contentView.activityIndicator)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dataProvider?.fetchPair(for: food) { [weak self] result in
                guard let `self` = self else { return }
                self.contentView.activityIndicator.stopAnimating()
                self.contentView.searchBar.text = ""
                switch result {
                case .failure(let error):
                    print(error)
                    self.showEmptyResults(searchedText: food)
                case .success(let pairing):
                    FeedbackManager.success()
                    
                    self.showPairingResults(pairing)
                }
            }
        }
    }
    
    private func showPairingResults(_ pairing: WinePairing) {
        let viewController = PairingViewController()
        viewController.viewModel = PairingViewModel(state: .pairing(pairing))
        
        present(viewController, animated: true)
    }
    
    private func showEmptyResults(searchedText: String) {
        let viewController = PairingViewController()
        viewController.viewModel = PairingViewModel(state: .empty(searchedText))
        
        present(viewController, animated: true)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        FeedbackManager.button()
        searchWinePairing(with: searchBar.text)
    }
}
