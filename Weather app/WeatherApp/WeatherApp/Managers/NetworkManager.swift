//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Nikhil Lalam on 3/16/24.
//

import Foundation

struct APIService {
    
    //static let shared = APIService()
    
    enum APIError: Error {
        case error(_ errorString: String)
    }
    
    //  Fetching and Decoding JSON Data
    func getJSON<T: Decodable>(urlString: String,
                               completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error("Error: Invalid URL")))
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.error("\(error.localizedDescription)")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error("Error: Data is currupt")))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.error("\(error.localizedDescription)")))
            }
            
        }.resume()
    }
}
