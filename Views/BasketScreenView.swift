//
//  BasketScreenView.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 09.12.2021.
//

import SwiftUI

struct BasketScreenView: View {
    
    var selectedScreen: SelectedScreen?
    
    @EnvironmentObject var basket: Basket
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.9162213802, green: 0.809459269, blue: 1, alpha: 1)).ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Корзина")
                        .font(.largeTitle)
                        Spacer()
                }
                .padding()
                
                Divider()
                    .offset(y: -15)
                
                ScrollView(showsIndicators: false) {
                    
                    
                    if basket.basket.isEmpty {
                        
                        VStack {
                            Spacer()
                            BasketIsEmptyView(selectedScreen: selectedScreen)
                        }
                        
                    } else {
                        BasketIsFilledView()
                    }
                }
            }
        }
    }
}

struct BasketScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BasketScreenView()
    }
}
