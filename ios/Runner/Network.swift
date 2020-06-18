//
//  Network.swift
//  Runner
//
//  Created by Hélio Mesquita on 17/06/20.
//

import Foundation
import Alamofire

class Network {
    
    
    enum Routes: URLConvertible {
        case categories
        case randomByCategory(String)
        
        func asURL() throws -> URL {
            switch self {
            case .categories:
                return URL(string: "https://api.chucknorris.io/jokes/categories")!
            case .randomByCategory(let category):
                return URL(string: "https://api.chucknorris.io/jokes/random?category=\(category)")!
            }
        }
    }
    
    func getCategories(onSuccess: @escaping (String) -> Void) {
        fetch(url: Routes.categories, onSuccess: onSuccess)
    }
    
    func getRandomByCategories(category: String, onSuccess: @escaping (String) -> Void) {
        fetch(url: Routes.randomByCategory(category), onSuccess: onSuccess)
    }
    
    
    private func fetch (url: URLConvertible, onSuccess: @escaping (String) -> Void) {
        Alamofire.request(url).responseString { (response) in
            onSuccess(response.result.value ?? "")
        }
    }
    
}
