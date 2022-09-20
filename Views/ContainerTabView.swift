//
//  TabView.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 09.12.2021.
//

import SwiftUI

struct ContainerTabView: View {
    
    @ObservedObject var selectedScreen = SelectedScreen()
    
    init() {
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.5448341966, green: 0.1447607577, blue: 1, alpha: 1)
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 15, weight: .light), .foregroundColor: UIColor.black], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 15, weight: .light), .foregroundColor: UIColor.black], for: .selected)
    }
    
    var body: some View {
        
        ZStack {
            
            TabView(selection: $selectedScreen.number) {
                
                MainScreenView()
                    .tabItem {
                        Image(systemName: "face.smiling")
                        Text("Главная")
                    } .tag(1)
                
                SalesScreenView()
                    .tabItem {
                        Image(systemName: "giftcard")
                        Text("Акции")
                    } .tag(2)
                
                BasketScreenView(selectedScreen: selectedScreen)
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Корзина")
                    } .tag(3)
                
                MenuScreenView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Меню")
                    } .tag(4)
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerTabView()
    }
}
