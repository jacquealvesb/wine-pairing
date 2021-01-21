//
//  PairingViewController.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 15/01/21.
//

import UIKit

class PairingViewController: UIViewController {
    
    // MARK: - Views
    
    let contentView: PairingView = PairingView(frame: UIScreen.main.bounds)
    
    // MARK: - Variables
    
    var viewModel: PairingViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            contentView.setup(with: viewModel, delegate: self)
        }
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotifications()
    }
    
    // MARK: - Setups
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(shareWineButtonPressed(notification:)),
                                               name: Notification.Name("shareWine"),
                                               object: nil)
    }
    
    // MARK: - Share functions
    
    @objc func shareWineButtonPressed(notification: Notification) {
        if let wine = notification.object as? Wine {
            let textItem: String = "Checkout what 'Wine Pairing' suggested to drink with our meal: 🍷\n\n\(wine.link)\n"
            
            share(with: [textItem])
            
        } else {
            FeedbackManager.error()
        }
    }
    
    private func share(with items: [Any?]) {
        let activityViewController = UIActivityViewController(activityItems: items.compactMap { $0 }, applicationActivities: nil)
        present(activityViewController, animated: true)
    }
}

// MARK: - PairingViewDelegate

extension PairingViewController: PairingViewDelegate {
    func didClickCloseButton() {
        self.dismiss(animated: true)
    }
    
    func didClickMoreDetailsButton(text: String?) {
        guard let text = text else { return }
        let viewController = DetailsQuoteViewController()
        viewController.text = text
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
    }
}
