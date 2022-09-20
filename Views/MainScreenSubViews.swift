//
//  MainScreenSubViews.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 10.12.2021.
//

import SwiftUI

struct SaleView: View {
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Специально для Вас:")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.top)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -30) {
                    
                    ForEach(sales) { item in
                        SaleSectionView(saleModel: item)
                    }
                }
            }
            .padding(.leading, -5)
            .padding(.top, -10)
        }
    }
}

struct SaleSectionView: View {
    
    var saleModel: SaleModel
    
    var body: some View {
        VStack {
            saleModel.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .padding(.horizontal, 25)
                .padding(.vertical, 20)
                
        }
        .frame(width: 350)
        
    }
}

struct FavoritesMenu: View {
    
    let colums = [GridItem(.flexible(minimum: 50)),
                  GridItem(.flexible(minimum: 50))]
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Попробуй лучшее!")
                    .font(.title)
                    .fontWeight(.light)
                Spacer()
            }
            .padding(.horizontal)
            
            LazyVGrid(columns: colums, spacing: 0) {
                ForEach(favorites) { item in
                    FavoritesMenuSection(product: item)
                }
            }
            .offset(y: -20)
        }
    }
}

struct FavoritesMenuSection: View {
    
    var product: ProductModel
    
    @State private var detailViewIsPresented = false
    
    var body: some View {
        
        VStack {
            
            ZStack {
                Color(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 150, height: 150)
                
                product.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 150, height: 150)
                    .padding()
            }
            
            Text(product.name)
                .font(.subheadline)
                .fontWeight(.regular)
                .frame(width: 150, height: 60)
            
            HStack(spacing: 6) {
                
                Text("\(product.cost) р")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .padding(6)
                    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                
                Button(action: { detailViewIsPresented.toggle() }) {
                    Text("Подробнее")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .padding(6)
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                }
                
            }
            .padding(.horizontal, 3)
        }
        .frame(width: 160, height: 300)
        .foregroundColor(.black)
        .sheet(isPresented: $detailViewIsPresented) {
            ProductDetailView(product: product, detailViewIsPresented: $detailViewIsPresented)
        }
    }
}

struct MainScreenSubViews_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
