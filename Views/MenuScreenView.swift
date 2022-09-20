//
//  MenuScreenView.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 15.11.2021.
//

import SwiftUI

struct MenuScreenView: View {
    
    @State private var categoryNumber = 0
    
    var body: some View {
            
            ZStack {
                
                Color(#colorLiteral(red: 0.9162213802, green: 0.809459269, blue: 1, alpha: 1)).ignoresSafeArea(edges: .all)
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            Picker(selection: $categoryNumber, label: Text("")) {
                                ForEach(0..<categories.count) { item in
                                    Text(categories[item].name)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding()
                        }
                    }
                    .padding(.vertical)
                    
                    MenuList(selectedCategory: categories[categoryNumber])
                    
                }
                .onAppear {
                UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 18, weight: .regular), .foregroundColor: UIColor.black], for: .normal)
                UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 18, weight: .regular), .foregroundColor: UIColor.black], for: .selected)
                UITableView.appearance().backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.9162213802, green: 0.809459269, blue: 1, alpha: 1))
            }
        }
        
    }
    
}


struct MenuScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreenView()
    }
}
