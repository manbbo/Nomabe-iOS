//
//  FoodListModel.swift
//  Nomabe iOS
//
//  Created by Piton on 28/06/24.
//

import Foundation

struct ProductItem: Equatable {
    let itemID: String
    let itemName: String
    let itemDescription: String
    let itemImage: String
    let itemNutrition: NutritionValues
    let itemPrice: Double

    static func fromJson(json: [String: Any]) -> ProductItem? {
        guard
            let itemName = json["itemName"] as? String,
            let itemDescription = json["itemDescription"] as? String,
            let itemImage = json["itemImage"] as? String,
            let itemNutritionJson = json["itemNutrition"] as? [String: Any],
            let itemNutrition = NutritionValues.fromJson(json: itemNutritionJson),
            let itemPrice = json["itemPrice"] as? Double,
            let itemID = json["itemID"] as? String
        else {
            return nil
        }
        return ProductItem(itemID: itemID,
                           itemName: itemName,
                           itemDescription: itemDescription,
                           itemImage: itemImage,
                           itemNutrition: itemNutrition,
                           itemPrice: itemPrice)
    }
    
    func matches(query: String) -> Bool {
        let lowercasedQuery = query.lowercased()
        
        if itemName.lowercased().contains(lowercasedQuery) {
            return true
        }
        
        if itemNutrition.getItemNames().lowercased().contains(lowercasedQuery) {
            return true
        }
        
        if itemNutrition.getMacros().lowercased().contains(lowercasedQuery) {
            return true
        }
        
        return false
    }
    
    func getFormattedPrice() -> String {
        return itemPrice.formatAsPrice()
    }
}

struct NutritionValues: Equatable {
    let nutritionItems: [NutritionItem]

    func getItemNames() -> String {
        return nutritionItems.map { $0.itemName }.joined(separator: ", ")
    }

    func getTotalWeight() -> Double {
        return nutritionItems.reduce(0) { $0 + $1.weight }
    }

    func getTotalCalories() -> Double {
        return nutritionItems.reduce(0) { $0 + $1.calories }
    }

    func getTotalProteins() -> Double {
        return nutritionItems.reduce(0) { $0 + $1.proteins }
    }

    func getTotalFats() -> Double {
        return nutritionItems.reduce(0) { $0 + $1.fats }
    }

    func getTotalCarbohydrates() -> Double {
        return nutritionItems.reduce(0) { $0 + $1.carbohydrates }
    }

    func getMacros() -> String {
        return "Cals: \(String(format: "%.2f", getTotalCalories()))cal, Prots: \(String(format: "%.2f", getTotalProteins()))g, Fats: \(String(format: "%.2f", getTotalFats()))g, Carbs: \(String(format: "%.2f", getTotalCarbohydrates()))g"
    }

    static func fromJson(json: [String: Any]) -> NutritionValues? {
        guard let nutritionItemsJson = json["nutritionItems"] as? [[String: Any]] else {
            return nil
        }
        let nutritionItems = nutritionItemsJson.compactMap { NutritionItem.fromJson(json: $0) }
        return NutritionValues(nutritionItems: nutritionItems)
    }
}

struct NutritionItem: Equatable {
    let itemName: String
    let weight: Double
    let calories: Double
    let proteins: Double
    let fats: Double
    let carbohydrates: Double

    static func fromJson(json: [String: Any]) -> NutritionItem? {
        guard
            let itemName = json["itemName"] as? String,
            let weight = json["weight"] as? Double,
            let calories = json["calories"] as? Double,
            let proteins = json["proteins"] as? Double,
            let fats = json["fats"] as? Double,
            let carbohydrates = json["carbohydrates"] as? Double
        else {
            return nil
        }
        return NutritionItem(itemName: itemName,
            weight: weight,
            calories: calories,
            proteins: proteins,
            fats: fats,
            carbohydrates: carbohydrates)
    }
}
