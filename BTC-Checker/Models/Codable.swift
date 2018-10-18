//
//  Codable.swift
//  BTC-Checker
//
//  Created by Ada 2018 on 21/09/2018.
//  Copyright © 2018 tavaboy+daniboy. All rights reserved.
//

import Foundation

struct Coin: Codable {
    let m15: Double
    let last: Double
    let buy: Double
    let sell: Double
    let symbol: String
    
    enum CodingKeys: String, CodingKey {
        case m15 = "15m"
        case last
        case buy
        case sell
        case symbol
    }
}
