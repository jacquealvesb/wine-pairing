//
//  ViewController.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 10/12/20.
//

import UIKit

class MainViewController: UIViewController {
    
    let screen = MainView(frame: UIScreen.main.bounds)
    
    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
