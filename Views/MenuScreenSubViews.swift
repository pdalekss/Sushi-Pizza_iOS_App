//
//  MenuScreenSubViews.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 10.12.2021.
//

import SwiftUI

struct MenuList: View {
    
    var selectedCategory: CategoryModel
    
    var body: some View {
        
        List {
            ForEach(selectedCategory.content) { good in
                ProductCard(product: good)
            }
        }
        .offset(y: -20)
        
    }
    
}

struct ProductCard: View {
    
    var product: ProductModel
    
    @State var detailViewIsPresented = false
    
    var body: some View {
        
        Button(action: { detailViewIsPresented.toggle() }) {
            
            HStack {
                product.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                    .offset(x: -8, y: 0)
                
                Spacer()
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding(.bottom, 1)
                    
                    Text(product.description)
                        .font(.caption)
                        .fontWeight(.light)
                        .lineLimit(3)
                    
                    HStack {
                        
                        Text("\(product.cost) р")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(6)
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .padding(.leading, 5)
                            .padding(.bottom, 5)
                        
                        
                        Spacer()
                        
                        Text("Подробнее")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .padding(6)
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .padding(.trailing, 5)
                            .padding(.bottom, 5)
                        
                    }
                    .padding(2)
                }
            }
            .padding(.leading)
        }
        .sheet(isPresented: $detailViewIsPresented) {
            ProductDetailView(product: product, detailViewIsPresented: $detailViewIsPresented)
        }
        .listRowBackground(Color(#colorLiteral(red: 0.798677206, green: 0.4992062449, blue: 1, alpha: 0.3497931878)))
    }
}

struct ProductDetailView: View {
    
    var product: ProductModel
    
    @Binding var detailViewIsPresented: Bool
    
    @EnvironmentObject var basket: Basket
    
    func addProductToBasket(product: ProductModel) {

        var counter = 0
        
        let usersProduct = ProductInBasket(product: product, quantity: 0)
        
        for product in basket.basket {
            if usersProduct.product.name == product.product.name {
                counter += 1
                product.quantity += 1
            }
        }
        if counter == 0 {
            usersProduct.quantity += 1
            basket.basket.append(usersProduct)
        }
    }
    
    var body: some View {
        
        ZStack {
            
            Color(#colorLiteral(red: 0.798677206, green: 0.4992062449, blue: 1, alpha: 0.3497931878))
                .ignoresSafeArea(.all)
            
            VStack {
                product.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
                Divider()
                
                HStack {
                    Text(product.name)
                        .font(.title)
                        .fontWeight(.regular)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                HStack {
                    Text(product.description)
                        .font(.title3)
                        .fontWeight(.light)
                    Spacer()
                }
                .padding(.horizontal)

                HStack {
                    Text("\(product.cost) р")
                        .font(.title)
                        .fontWeight(.regular)
                        .padding(6)
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                    
                    Spacer()
                    
                    Button(action: {
                            addProductToBasket(product: self.product)
                        detailViewIsPresented.toggle()
                    }) {
                        
                        Text("Добавить")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                            .padding(6)
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                    }
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct MenuScreenSubViews_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreenView()
    }
}
