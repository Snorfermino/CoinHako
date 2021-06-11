//
//  WatchListPresenter.swift
//  CoinHako_Assignment
//
//  Created by Tien Dat on 6/7/21.
//

import SwiftUI
import Combine

class WatchListPresenter: ObservableObject {
    @Published var watchingCrypto: [Crypto] = []
    private let interactor: WatchListInteractor
    private lazy var cancellables = Set<AnyCancellable>()
    
    init(interactor: WatchListInteractor) {
        self.interactor = interactor
        interactor.dataModel.$watchingCrypto
            .assign(to: \.watchingCrypto, on: self)
            .store(in: &cancellables)
    }
}
