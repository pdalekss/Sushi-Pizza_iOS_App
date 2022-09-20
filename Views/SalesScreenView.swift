//
//  SalesScreenView.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 09.12.2021.
//

import SwiftUI

struct SalesScreenView: View {
    
    var body: some View {
        VStack {
            ZStack {
                
                Color(#colorLiteral(red: 0.9162213802, green: 0.809459269, blue: 1, alpha: 1))
                
                VStack {
                    
                    Spacer(minLength: 50)
                    
                    HStack {
                        Text("Акции")
                            .font(.largeTitle)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .offset(y: -15)
                    
                    SalesList()
                        .offset(y: -20)
                }
            }
            .ignoresSafeArea()
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.9162213802, green: 0.809459269, blue: 1, alpha: 1))
            }
        }
    }
}

struct SalesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SalesScreenView()
    }
}
