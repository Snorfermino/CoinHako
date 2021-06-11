//
//  ContentView.swift
//  CoinHako_Assignment
//
//  Created by Tien Dat on 6/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: WatchListModel
    var body: some View {
        NavigationView {
           
                WatchListView(presenter: WatchListPresenter(interactor: WatchListInteractor(model: model)))
                    
        }.resignKeyboardOnDragGesture()
        .colorScheme(.dark)
        .onAppear {
            model.startUpdatePrice()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
