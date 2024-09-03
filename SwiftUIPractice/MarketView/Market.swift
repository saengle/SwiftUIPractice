//
//  Market.swift
//  SwiftUIPractice
//
//  Created by 쌩 on 9/3/24.
//

import Foundation

typealias Markets = [Market]

struct UpbitAPI {
    
    private init() { }

    static func fetchAllMarket(completion: @escaping (Markets) -> Void) {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(Markets.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    static func fetchMarket() async throws -> Markets {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        let (data, response) = try await URLSession.shared.data(from: url) // try await 사용으로 응답이 올 때까지 다음 작업으로 넘어가지 않고 기다림.
        
        let decodedData = try JSONDecoder().decode(Markets.self, from: data)
        
        return decodedData
    }
}

struct Market: Hashable, Codable {
    let market, koreanName, englishName: String

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}
