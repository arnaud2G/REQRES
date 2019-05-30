//
//  Page.swift
//  Arnaud
//
//  Created by Arnaud Verrier on 30/05/2019.
//  Copyright © 2019 Arnaud Verrier. All rights reserved.
//

import Foundation

struct Page: Decodable {
    
    let data: [Color]
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
}
