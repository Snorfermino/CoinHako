//
//  WatchListModel.swift
//  CoinHako_Assignment
//
//  Created by Tien Dat on 6/7/21.
//

import Foundation
import Combine

class WatchListModel: ObservableObject, Identifiable {
    @Published var watchingCrypto: [Crypto] = []
    @Published var cryptos: [Crypto] = []
    var timer:Timer!
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getCryptoPrice()
    }
    
    func startUpdatePrice() {
        print("startUpdatePrice")
        guard (timer == nil) else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { _ in
            print("API Calling....")
            self.getCryptoPrice()
        })
    }
    
    func getCryptoPrice() {
        print("getPrice")
        APIClient.getCryptos()
            .assign(to: \.watchingCrypto, on: self)
            .store(in: &self.cancellables)
    }
}
