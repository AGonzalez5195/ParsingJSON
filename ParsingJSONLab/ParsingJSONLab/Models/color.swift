//
//  color.swift
//  ParsingJSONLab
//
//  Created by Anthony Gonzalez on 8/27/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import Foundation

struct ColorModel: Codable {
    let colors: [ColorResults]
}

struct ColorResults: Codable {
    let name: nameWrapper
    let hex: hexWrapper
    let rgb: rgbWrapper
    
    
    static func getColors(from data: Data) throws -> [ColorResults] {
        do {
            let colors = try JSONDecoder().decode(ColorModel.self, from: data)
            return colors.colors
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct nameWrapper: Codable {
    let value: String
}

struct hexWrapper: Codable {
    let value: String
}

struct rgbWrapper: Codable {
    let fraction: fractionWrapper
}

struct fractionWrapper: Codable {
    let r: Double
    let g: Double
    let b: Double
}


















