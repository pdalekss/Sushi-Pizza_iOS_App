//
//  ContentView.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 13.11.2021.
//

import SwiftUI

struct MainScreenView: View {
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.9162213802, green: 0.809459269, blue: 1, alpha: 1))
                .ignoresSafeArea(edges: .all)
            
            ScrollView(showsIndicators: false ) {
                
                SaleView()
                
                FavoritesMenu()
                    .padding(.bottom, 50)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}






