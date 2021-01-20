//
//  PairingViewController.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 15/01/21.
//

import UIKit

class PairingViewController: UIViewController {
    
    let contentView: PairingView = PairingView(frame: UIScreen.main.bounds)
    
    var viewModel: PairingViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            contentView.setup(with: viewModel, delegate: self)
        }
    }
    
    override func loadView() {
        self.view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(shareWineButtonPressed(notification:)), name: Notification.Name("shareWine"), object: nil)
    }
    
    @objc func shareWineButtonPressed(notification: Notification) {
        print(notification.object)
    }
}

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
