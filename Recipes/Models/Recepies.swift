// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct Welcome: Codable {
    let recipes: [Recipes]
}

// MARK: - Recipe
struct Recipes: Codable,Identifiable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool
    let veryHealthy, cheap, veryPopular, sustainable: Bool
    let lowFodmap: Bool
    let weightWatcherSmartPoints: Int
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int
    let pricePerServing: Double
    let extendedIngredients: [ExtendedIngredient]
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    let openLicense: Int
    let image: String?
    let imageType: String?
    let summary: String
    let cuisines, dishTypes, diets, occasions: [String]
    let instructions: String
    let sourceName, creditsText: String?
    let license: String?
    let analyzedInstructions: [AnalyzedInstruction]

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints,preparationMinutes, cookingMinutes, aggregateLikes, healthScore, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
        case openLicense, image, imageType, summary, cuisines, dishTypes, diets, occasions, instructions, sourceName, creditsText,analyzedInstructions
        case license
    }
}

struct AnalyzedInstruction: Codable {
    let name: String
    let steps: [Step]
}


struct Step: Codable,Identifiable {
    public var id: Int {
        number
    }
    let number: Int
    let step: String
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient: Codable,Identifiable {
    let id: Int
    let aisle, image: String?
    let name: String
    let nameClean: String?
    let original, originalName: String
    let amount: Double
    let unit: String
    let meta: [String]
}

