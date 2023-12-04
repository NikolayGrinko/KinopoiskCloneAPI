//
//  APICaller.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 03.12.2023.
//

import Foundation
import UIKit
import SwiftyJSON
//import Alamofire

struct NewConstants {
    
 
    static let baseURL = "https://api.kinopoisk.dev/"
    static let tut = "accept: application/json"
    static let  X_API_KEY = "NVCS5FH-72K4GM4-MXNKNSA-VYQT0YG"
    
    static let url = "https://api.kinopoisk.dev/v1.4/movie?year=2023&genres.name=криминал"
    
    
}

enum APIError: Error {
    
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTop250Movies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        let headers = [
            "accept": "application/json",
            "X-API-KEY": "74add9bb-1512-45be-b299-de9970c4cf64"
        ]


        let request = NSMutableURLRequest(url: NSURL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films/700")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
            }
        })

        dataTask.resume()
    }
}


/*
 
 */

