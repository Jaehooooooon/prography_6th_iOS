//
//  Model.swift
//  Prography_6th_iOS
//
//  Created by 서재훈 on 2020/03/01.
//  Copyright © 2020 서재훈. All rights reserved.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let status: String?
    let statusMessage: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let movieCount: Int?
    let limit: Int?
    let movies: [Movie]?
}

// MARK: - Movie
struct Movie: Codable {
    let title: String?
    let rating: Double?
}
