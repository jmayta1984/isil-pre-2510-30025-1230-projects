//
//  HeroDTO.swift
//  SuperHero
//
//  Created by Jorge Mayta on 17/07/25.
//

struct HeroWrapperDTO: Decodable {
    let heroes: [HeroDTO]
    
    enum CodingKeys: String, CodingKey {
        case heroes = "results"
    }
}

struct HeroDTO: Decodable {
    let id: String?
    let name: String?
    let powerstats: PowerstatsDTO
    let biography: BiographyDTO
    let image: ImageDTO
    
    func toDomain() -> Hero {
        Hero(id: id ?? "",
             name: name ?? "",
             intelligence: powerstats.intelligence.map({ Int($0) ?? 0}) ?? 0,
             strength: powerstats.strength.map({ Int($0) ?? 0}) ?? 0,
             speed: powerstats.speed.map({ Int($0) ?? 0}) ?? 0,
             durability: powerstats.durability.map({ Int($0) ?? 0}) ?? 0,
             power: powerstats.power.map({ Int($0) ?? 0}) ?? 0,
             combat: powerstats.combat.map({ Int($0) ?? 0}) ?? 0,
             fullName: biography.fullName ?? "",
             poster: image.url ?? "")
    }
}

struct PowerstatsDTO: Decodable {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?
}

struct BiographyDTO: Decodable {
    let fullName: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
    }
}

struct ImageDTO: Decodable {
    let url: String?
}
