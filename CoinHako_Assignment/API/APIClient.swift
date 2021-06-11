//
//  APIClient.swift
//  CoinHako_Assignment
//
//  Created by Tien Dat on 6/7/21.
//

import Combine
import Alamofire

final class APIClient {
    static let baseURL = "https://www.coinhako.com/api/v3/price/all_prices_for_mobile?counter_currency=USD"
    static func getCryptos() -> AnyPublisher<[Crypto],Never> {
        return Future<[Crypto],Never> { promise in
                AF.request(URL(string: baseURL)!, method: .get).validate().responseDecodable(of: Cryptos.self) { response in
                    switch response.result {
                    case .failure(let error):
                        print(error)
                        break
                    case .success(let data):
                        print(data.cryptos)
                        promise(.success(data.cryptos))
                        break
                    }
                }
        }.eraseToAnyPublisher()
    }
}
