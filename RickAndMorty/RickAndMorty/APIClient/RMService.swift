//
//  RMService.swift
//  RickAndMorty
//
//  Created by Mitya Kim on 4/27/23.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    private let casheManager = RMAPICacheManager()
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        if let cachedData = casheManager.cachedResponse(for: request.endpoint, url: request.url) {
            do {
                let result = try JSONDecoder() .decode(type.self, from: cachedData)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
            return
        }
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
            DispatchQueue.main.async {
                guard let data, error == nil else {
                    completion(.failure(error ?? RMServiceError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(type.self, from: data)
                    
                    self?.casheManager.setCache(for: request.endpoint, url: request.url, data: data)
                    
                    completion(.success(result))
//                    let json = try JSONSerialization.jsonObject(with: data)
//                    print(String(describing: json))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
