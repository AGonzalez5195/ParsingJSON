//
//  users.swift
//  ParsingJSONLab
//
//  Created by Anthony Gonzalez on 8/28/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import Foundation

struct usersModel: Codable {
    let results: [userResults]
}

struct userResults: Codable {
    let name: userNameWrapper
    let location: locationWrapper
    let phone: String
    var dob: dobWrapper
    
    
    static func getUsers(from data: Data) throws -> [userResults] {
        do {
            let users = try JSONDecoder().decode(usersModel.self, from: data)
            return users.results
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}

struct userNameWrapper: Codable {
    let first: String
}

struct locationWrapper: Codable {
    let street: String
    let city: String
    let state: String
}

struct dobWrapper: Codable {
    var date: String
}
