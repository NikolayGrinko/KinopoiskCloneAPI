//
//  YoutubeSearchResponse.swift
//  KinopoiskCloneAPI
//
//  Created by Николай Гринько on 09.10.2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: idVideoElement
}

struct idVideoElement: Codable {
    let kind: String
    let videoId: String
}
