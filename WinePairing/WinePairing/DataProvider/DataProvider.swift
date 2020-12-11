//
//  DataProvider.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 11/12/20.
//

import Foundation

protocol DataProvidable {
    func fetchPair(for food: String, completion: @escaping (Result<WinePairing, APIError>) -> Void)
}

enum SpoonacularEndpoint: Endpoint {
    case winePairing

    var rawValue: String {
        switch self {
        case .winePairing:
            return "https://api.spoonacular.com/food/wine/pairing"
        }
    }
}

final class DataProvider: DataProvidable {
    
    // MARK: - Constants
    
    let kFoodKey = "food"
    
    // MARK: - Variables
    
    private var apiService: APIService
    
    // MARK: - Functions
    
    init(service: Service, apiKey: String) {
        let configuration = APIServiceConfiguration(apiKey: apiKey)
        apiService = APIService(configuration: configuration, service: service)
    }
    
    func fetchPair(for food: String, completion: @escaping (Result<WinePairing, APIError>) -> Void) {
        let parameters: [String: String] = [kFoodKey: food]
        
        apiService.fetch(from: SpoonacularEndpoint.winePairing,
                         parameters: parameters,
                         completion: completion)
    }
}
