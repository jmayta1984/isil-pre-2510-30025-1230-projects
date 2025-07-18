//
//  HeroService.swift
//  SuperHero
//
//  Created by Jorge Mayta on 17/07/25.
//

import Foundation

class HeroService {
    
    static let shared = HeroService()
    private init() {}
    
    let baseURL = "https://www.superheroapi.com/api.php/f274286a22873ec9fc7a5782940f7ca2/search/"
    
    func searchHeroes(name: String, completion: @escaping([Hero]?, String?) -> Void) {
        
        guard let url = URL(string: "\(baseURL)\(name)") else {
            print("Error: Cannot create URL")
            completion(nil, "Error: Cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil , "Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            guard let data = data else {
                print("Error: No data found")
                completion(nil, "Error: No data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print( "Error: HTTP status code \(String(describing: response))")
                completion(nil , "Error: HTTP status code \(String(describing: response))")
                return
            }
            
            do {
                let wrapper = try JSONDecoder().decode(HeroWrapperDTO.self, from: data)
                let heroes = wrapper.heroes.map({$0.toDomain()})
                completion(heroes, nil)
    
            } catch let jsonError as NSError {
                print("Error parsing JSON: \(jsonError.localizedDescription)")
                completion(nil, "Error parsing JSON: \(jsonError.localizedDescription)")
            }
            
        }
        
        task.resume()
    }
}
