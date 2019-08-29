//
//  weather.swift
//  ParsingJSONLab
//
//  Created by Anthony Gonzalez on 8/27/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import Foundation

struct WeatherModel: Codable {
    let list: [WeatherResult]
}

struct WeatherResult: Codable {
    let name: String
    let main: mainUnwrapper
    let weather: [weatherUnwrapper]
    
    static func getWeather(from data: Data) throws -> [WeatherResult] {
        do {
            let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
            return weather.list
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct mainUnwrapper: Codable {
    let temp: Double
}

struct weatherUnwrapper: Codable {
    let main: String
}
