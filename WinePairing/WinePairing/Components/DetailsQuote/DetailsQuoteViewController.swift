//
//  DetailsQuoteViewController.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 18/01/21.
//

import UIKit

class DetailsQuoteViewController: UIViewController {
    
    // MARK: - Variables
    
    var text: String? {
        didSet {
            guard let text = text else { return }
            contentView.setup(with: text)
        }
    }
    
    var didDismiss: (() -> Void)?
    
    // MARK: - Views

    let contentView = DetailsQuoteView(frame: UIScreen.main.bounds)
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.closeButton.action = { [weak self] in
            guard let `self` = self else { return }
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: Notification.Name("didDismissMoreDetails"), object: nil)
            }
        }
    }
}
