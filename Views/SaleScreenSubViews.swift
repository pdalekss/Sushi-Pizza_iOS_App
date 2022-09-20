//
//  SaleScreenSubViews.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 10.12.2021.
//

import SwiftUI

struct SalesList: View {
    
    var body: some View {
        List {
            ForEach(sales) { sale in
                SaleCard(sale: sale)
            }
        }
    }
}

struct SaleCard: View {
    
    var sale: SaleModel
    
    var body: some View {
        
        VStack {
            
            sale.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            
            HStack {
                Text(sale.name)
                    .font(.title)
                    .fontWeight(.regular)
                Spacer()
            }
            
            HStack {
                Text(sale.description)
                    .font(.body)
                Spacer()
            }
        }
        .padding(.vertical, 5)
        .listRowBackground(Color(#colorLiteral(red: 0.9162213802, green: 0.809459269, blue: 1, alpha: 1)))
    }
}

struct SaleScreenSubViews_Previews: PreviewProvider {
    static var previews: some View {
        SalesScreenView()
    }
}
