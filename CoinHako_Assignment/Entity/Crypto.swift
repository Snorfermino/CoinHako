//
//  Crypto.swift
//  CoinHako_Assignment
//
//  Created by Tien Dat on 6/7/21.
//

import Foundation
import Combine

final class Crypto {
    @Published var name: String = ""
    @Published var base: String = ""
    @Published var buy : String = ""
    @Published var sell: String = ""
    @Published var icon: String = ""
    @Published var counter: String = ""
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        base = try container.decode(String.self, forKey: .base)
        buy = try container.decode(String.self, forKey: .buy)
        sell = try container.decode(String.self, forKey: .sell)
        icon = try container.decode(String.self, forKey: .icon)
        counter = try container.decode(String.self, forKey: .counter)
    }
}

extension Crypto: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case base
        case buy = "buy_price"
        case sell = "sell_price"
        case icon = "icon"
        case counter
    }
}


extension Crypto: Identifiable {}

extension Crypto: ObservableObject {}

final class Cryptos: Decodable {
    let cryptos: [Crypto]
    
    enum CodingKeys: String, CodingKey {
        case cryptos = "data"
    }
}
