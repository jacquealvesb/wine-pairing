//
//  PairingViewModel.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 15/01/21.
//

enum PairingViewState {
    case empty(String), pairing(WinePairing)
}

import Foundation

final class PairingViewModel {
    let state: PairingViewState
    
    init(state: PairingViewState) {
        self.state = state
    }
}
