//
//  Models.swift
//  Sushi&Pizza
//
//  Created by Даниил Пасечник on 13.11.2021.
//

import Foundation
import SwiftUI

// Модель Акции
struct SaleModel: Identifiable {
    var id = UUID()
    let name: String
    let description: String
    let image: Image
}

// Модель товара
struct ProductModel: Identifiable {
    var id = UUID()
    let name: String
    let description: String
    let image: Image
    let cost: Int
}

//Модель категории
struct CategoryModel: Identifiable {
    let categoryID: Int
    var id = UUID()
    let name: String
    let content: [ProductModel]
}


