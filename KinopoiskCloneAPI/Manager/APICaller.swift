//
//  APICaller.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 27.11.2023.
//

import Foundation
import UIKit


struct NewConstants {
    
   static let headers = [
        "accept": "application/json",
        "X-API-KEY": "NVCS5FH-72K4GM4-MXNKNSA-VYQT0YG"
    ]
    
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTop250Movies(completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.kinopoisk.dev/v1.4/movie/600")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 5.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = NewConstants.headers
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if let error  {
                print(error as Any)
                completion(.failure(error))
                return
            }
 
            if let data {
                do {
                    let model = try JSONDecoder().decode(MovieResponse.self, from: data)
                    completion(.success(model))
                    print(model)
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
        })
        dataTask.resume()
    }


//    func getTrendingTvs(completion: @escaping (Result<[Model], Error>) -> Void) {
//        
//    }
//    
//    func getPopular(completion: @escaping (Result<[Model], Error>) -> Void) {
//
//        
//    }
//    
//    func getUncoming(completion: @escaping (Result<[Model], Error>) -> Void) {
//
//        
//        
//    }
    
}


