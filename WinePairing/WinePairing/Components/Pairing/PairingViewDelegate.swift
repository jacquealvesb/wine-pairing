//
//  PairingViewDelegate.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 15/01/21.
//

import Foundation

protocol PairingViewDelegate: class {
    func didClickCloseButton()
    func didClickMoreDetailsButton(text: String?)
}

extension PairingViewDelegate {
    func didClickCloseButton() {}
    func didClickMoreDetailsButton(text: String? = nil) {}
}
