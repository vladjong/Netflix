//
//  Movie.swift
//  Netflix
//
//  Created by Владислав Гайденко on 28.05.2022.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let items : [Title]
}

struct Title: Codable {
    let crew: String?
    let fullTitle: String?
    let id: String?
    let imDbRating: String?
    let imDbRatingCount: String?
    let image: String?
    let rank: String?
    let rankUpDown: String?
    let title: String?
    let year: String?
}
