//
//  Wine.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 11/12/20.
//

struct Wine: Codable {
    var id: Int
    var title: String
    var averageRating: Float
    var imageURL: String
    var link: String
    var ratingCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case averageRating
        case imageURL = "imageUrl"
        case link
        case ratingCount
    }
}
