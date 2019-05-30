//
//  REQRESAPIError.swift
//  Arnaud
//
//  Created by Arnaud Verrier on 30/05/2019.
//  Copyright © 2019 Arnaud Verrier. All rights reserved.
//

import Foundation

enum APIError: Error {
    
    case apiError
    case decodableError
    
    var localizedDescription: String {
        
        switch self {
        case .apiError:
            return "error with api request"
        case .decodableError:
            return "error trying to decode response"
        }
    }
}
