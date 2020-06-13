//
//  Money.swift
//  Responsive-Flowers
//
//  Created by Mieszko Wawrzyniak on 13/06/2020.
//  Copyright © 2020 Mieszko Wawrzyniak. All rights reserved.
//

import Foundation

struct PLN {
    let grosze: Int
}

extension PLN: CustomStringConvertible {
    var description: String {
        let zl = grosze / 100
        let gr = grosze % 100

        return "\(zl),\(gr < 10 ? "0" : "")\(gr) PLN"
    }
}
