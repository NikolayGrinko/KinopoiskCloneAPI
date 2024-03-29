//
//  Title.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.10.2023.
//

import Foundation

// MARK: Крайнее

struct MovieResponse: Codable {
    let updatedAt: String?
    let similarMovies: [SimilarMovie]
    
   
    
   
    
    struct SimilarMovie: Codable {
        let identifire: Int
        let poster: Poster
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case identifire = "id"
            case poster = "poster"
            case name
           
        }
    }
    
    struct Poster: Codable {
        let url: String?
        let previewUrl: String?
      
    }

   
}
