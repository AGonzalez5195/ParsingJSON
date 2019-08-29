//
//  jsonError.swift
//  ParsingJSONLab
//
//  Created by Anthony Gonzalez on 8/28/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

