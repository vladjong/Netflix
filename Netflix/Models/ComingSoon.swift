//
//  ComingSoon.swift
//  Netflix
//
//  Created by Владислав Гайденко on 28.05.2022.
//

import Foundation

struct ComingSoonResponse: Codable {
    let items : [ComingSoon]
}

struct ComingSoon: Codable {
    let id: String?
    let title: String?
    let fullTitle: String?
    let year: String?
    let releaseState: String?
    let image: String?
    let runtimeMins: String?
    let runtimeStr: String?
    let plot: String?
    let contentRating: String?
    let iMDbRating: String?
    let iMDbRatingCount: String?
    let metacriticRating: String?
    let genres: String?
    let genreList: [String: String]?
    let directors: String?
    let directorList: [String: String]?
    let stars: String?
    let starList: [String: String]?
}
