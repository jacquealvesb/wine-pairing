//
//  WinePairing.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 11/12/20.
//

struct WinePairing: Codable {
    var categories: [String]
    var text: String
    var topPicks: [Wine]
    
    enum CodingKeys: String, CodingKey {
        case categories = "pairedWines"
        case text = "pairingText"
        case topPicks = "productMatches"
    }
}
