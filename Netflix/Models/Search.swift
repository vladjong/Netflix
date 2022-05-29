//
//  Search.swift
//  Netflix
//
//  Created by Владислав Гайденко on 29.05.2022.
//

import Foundation

struct SearchTitleResponse: Codable {
    let results : [Search]
}

struct Search: Codable {
    let image: String?
    let title: String?
}
