//
//  Tv.swift
//  Netflix
//
//  Created by Владислав Гайденко on 28.05.2022.
//

import Foundation

struct TrendingTvResponse: Codable {
    let items : [Tv]
}

struct Tv: Codable {
    let crew: String
    let fullTitle: String
    let id: String
    let imDbRating: String
    let imDbRatingCount: String
    let image: String
    let rank: String
    let rankUpDown: String
    let title: String
    let year: String
}
