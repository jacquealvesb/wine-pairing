//
//  AlmofireService.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 11/12/20.
//

import Foundation
import Alamofire

final class AlmofireService: Service {
    static let shared = AlmofireService()
    
    func fetch<T: Codable>(from endpoint: Endpoint,
                           parameters: [String: String]?,
                           completion: @escaping (Result<T, APIError>) -> Void) {
        
        AF.request(endpoint.rawValue, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { [weak self] response in
                guard let `self` = self else { return }
                completion(self.mapResult(result: response.result))
            }
    }
    
    func mapResult<T: Codable, E: Error>(result: Result<T, E>) -> Result<T, APIError> {
        
        result.mapError { error -> APIError in
            guard let error = error as? AFError else { return .unknown }
            
            if error.isInvalidURLError || error.isCreateURLRequestError {
                return .invalidURL
            } else if error.isSessionDeinitializedError || error.isSessionInvalidatedError || error.isExplicitlyCancelledError {
                return .apiError
            } else if error.isResponseValidationError {
                return .invalidResponse
            } else if error.isResponseSerializationError {
                return .serializationError
            } else {
                return .unknown
            }
        }
    }
}
