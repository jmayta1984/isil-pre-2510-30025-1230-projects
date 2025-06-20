//
//  Untitled.swift
//  EasyCocktails
//
//  Created by user272495 on 6/12/25.
//


struct CocktailsWrapper: Decodable {
    let cocktails: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktails = "drinks"
    }
}

struct Cocktail: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case image = "strDrinkThumb"
    }
}
