//
//  CocktailService.swift
//  EasyCocktails
//
//  Created by user272495 on 6/12/25.
//

import Foundation
class CocktailService {
    func searchCocktails(query: String, completion: @escaping([Cocktail]?, String?) -> Void)  {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(query)"
        
        guard let url = URL(string: urlString) else {
            completion(nil, "Cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion(nil, "No data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "HTTPRequest failed")
                return
            }
            do {
                let cocktailsWrapper = try JSONDecoder().decode(CocktailsWrapper.self, from: data)
                completion(cocktailsWrapper.cocktails, nil)
            } catch let decodingError {
                completion(nil, decodingError.localizedDescription)
            }
            
            
        }.resume()
    }
}
