//
//  BasketScreenSubViews.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 10.12.2021.
//

import SwiftUI

struct BasketIsEmptyView: View {
    
    var selectedScreen: SelectedScreen?
    
    var body: some View {
        
        VStack {
            
            Text( "Ваша корзина пуста. Пожалуйста, перейдите в меню и добавьте что-нибудь вкусного к себе в корзину!")
                .font(.title3)
                .fontWeight(.light)
                .padding()
            
            Button(action: {
                    guard let selectedScreen = selectedScreen else { return }
                    selectedScreen.number = 4
            }) {
                
                Text("Перейти в меню")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 250, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
            
            }
        }
    }
}

struct BasketIsFilledView: View {
    
    @EnvironmentObject var basket: Basket
    
    var body: some View {
        
        VStack {
            
            BasketList()
            
            Button(action: {}) {
                
                Text("Оформить заказ")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
            }
            .padding()
        }
    }
}

struct BasketList: View {
    
    @EnvironmentObject var basket: Basket
    
    var body: some View {
        VStack {
            VStack {
                ForEach(basket.basket) { product in
                    ProductCardInBasket(product: product)
                }
                .foregroundColor(.black)
                .padding(.horizontal)
            }
        }
    }
}

struct ProductCardInBasket: View {
    
    @ObservedObject var product: ProductInBasket
    
    @State private var detailViewIsPresented = false
    
    @EnvironmentObject var basket: Basket
    
    var body: some View {
        
        Button(action: { detailViewIsPresented.toggle() }) {
            
            HStack {
                product.product.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                    .offset(x: -8, y: 0)
                
                Spacer()
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    Text(product.product.name)
                        .font(.title3)
                        .fontWeight(.regular)
                        .padding(.bottom, 1)
                    
                    
                    HStack {
                        
                        Text("\(product.product.cost * product.quantity)  р")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(6)
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))

                        Spacer()
                        
                        HStack {
                            
                            Button(action: { if product.quantity >= 1 { product.quantity -= 1 } } ) {
                                Text("-")
                                    .font(.largeTitle)
                            }
                            
                            Text("\(product.quantity)")
                                .font(.title3)
                            
                            Button(action: { product.quantity += 1 }) {
                                Text("+")
                                    .font(.title)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $detailViewIsPresented) {
            ProductDetailView(product: product.product, detailViewIsPresented: $detailViewIsPresented)
        }
        .listRowBackground(Color(#colorLiteral(red: 0.798677206, green: 0.4992062449, blue: 1, alpha: 0.3497931878)))
    }
}

struct BasketScreenSubViews_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
