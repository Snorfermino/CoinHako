//
//  WatchListView.swift
//  CoinHako_Assignment
//
//  Created by Tien Dat on 6/7/21.
//

import SwiftUI

struct WatchListView: View {
    @ObservedObject var presenter: WatchListPresenter
    @State var searchText = ""
    var body: some View {
        VStack {
            // Search view
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass").foregroundColor(.green)
                    TextField("Search...", text: $searchText, onEditingChanged: { isEditing in
                       
                    }, onCommit: {
                        print("onCommit")
                    }).foregroundColor(.green)
                    .accessibilityIdentifier("searchTextField")
                    .foregroundColor(.green)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    
                    Button(action: {
                        UIApplication.shared.endEditing(true)
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }.accessibilityIdentifier("clearButton")
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
            }
            .padding(.horizontal)
            .animation(.linear)
            
            // Cryptos List
            List {
                ForEach ( searchText.isEmpty ? presenter.watchingCrypto : presenter.watchingCrypto.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.base.localizedCaseInsensitiveContains(searchText)} ) { crypto in
                    WatchListCell(crypto: crypto)
                        .frame(height: 70)
                }
            }.accessibilityIdentifier("cryptoList")

        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        let crypto = Crypto()
        crypto.name = "Bitcoin"
        crypto.base = "BTC"
        crypto.buy = "35500"
        crypto.sell = "35200"
        let model = WatchListModel()
        model.watchingCrypto = [crypto]
        let interactor = WatchListInteractor(model: model)
        let presenter = WatchListPresenter(interactor: interactor)
        return NavigationView {
            WatchListView(presenter: presenter)
        }
    }
}
