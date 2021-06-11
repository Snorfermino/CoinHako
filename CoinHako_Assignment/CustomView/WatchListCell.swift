//
//  WatchListCell.swift
//  CoinHako_Assignment
//
//  Created by Tien Dat on 6/8/21.
//

import SwiftUI
import Combine

struct WatchListCell: View {
    
    @ObservedObject var crypto: Crypto
    
 
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(crypto.base).font(.system(size: 24, weight: .bold)).foregroundColor(.green)
                Text(crypto.name).font(.system(size: 18, weight: .light)).foregroundColor(.green)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Buy").font(.system(size: 18, weight: .bold)).foregroundColor(.green)
                Text(crypto.buy).font(.system(size: 24, weight: .light)).foregroundColor(.green).accessibility(identifier: "buyPrice")
            }
            
            VStack(alignment: .trailing) {
                Text("Sell").font(.system(size: 18, weight: .bold)).foregroundColor(.red)
                Text(crypto.sell).font(.system(size: 24, weight: .light)).foregroundColor(.red).accessibility(identifier: "sellPrice")
            }
            
        }.padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
        
    }
}

struct WatchListCell_Previews: PreviewProvider {
    static var previews: some View {
        let crypto = Crypto()
        crypto.name = "Bitcoin"
        crypto.base = "BTC"
        crypto.buy = "35500"
        crypto.sell = "35200"
        return WatchListCell(crypto: crypto)
    }
}
