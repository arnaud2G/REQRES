//
//  Color.swift
//  Arnaud
//
//  Created by Arnaud Verrier on 30/05/2019.
//  Copyright © 2019 Arnaud Verrier. All rights reserved.
//

import Foundation

struct Color: Decodable {
    
    let id: Int
    let color: String
    let name: String
    let pantone_value: String
    let year: Int
}
