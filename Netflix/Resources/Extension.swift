//
//  Extension.swift
//  Netflix
//
//  Created by Владислав Гайденко on 28.05.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
