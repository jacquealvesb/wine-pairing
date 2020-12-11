//
//  APIService.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 11/12/20.
//

import Foundation

protocol Endpoint {
    var rawValue: String { get }
}

protocol Service {
    func fetch<T: Codable>(from endpoint: Endpoint, parameters: [String: String]?, completion: @escaping (Result<T, APIError>) -> Void)
    func mapResult<T: Codable, E: Error>(result: Result<T, E>) -> Result<T, APIError>
}

struct APIServiceConfiguration {
    var apiKey: String
}

enum APIError: Error {
    case apiError
    case invalidURL
    case invalidResponse
    case noData
    case serializationError
    case unknown
}

final class APIService {
    
    // MARK: - Constants
    
    let kApiKey = "apiKey"
    
    // MARK: - Variables
    
    var configuration: APIServiceConfiguration
    var service: Service
    
    // MARK: - Functions
    
    init(configuration: APIServiceConfiguration, service: Service) {
        self.configuration = configuration
        self.service = service
    }
    
    func fetch<T: Codable>(from endpoint: Endpoint,
                           parameters: [String: String]? = nil,
                           completion: @escaping (Result<T, APIError>) -> Void) {
        
        var params = parameters
        params?[kApiKey] = configuration.apiKey
        
        service.fetch(from: endpoint, parameters: params, completion: completion)
    }
}
