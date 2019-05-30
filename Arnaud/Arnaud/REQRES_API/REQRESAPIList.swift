//
//  REQRESAPIList.swift
//  Arnaud
//
//  Created by Arnaud Verrier on 30/05/2019.
//  Copyright © 2019 Arnaud Verrier. All rights reserved.
//


import Alamofire

class REQRESAPIList: APIListFetcherProtocol {
    
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func fetchList(in page: Int? = nil, succeed: ((_ page: Page) -> Void)?, failed: ((_ error: Error) -> Void)?) {
        Alamofire.request(url).responseJSON { response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                
                let decoder = JSONDecoder()
                
                do {
                    let page = try decoder.decode(Page.self, from: data)
                    succeed?(page)
                } catch {
                    failed?(APIError.decodableError)
                }
            } else {
                failed?(APIError.apiError)
            }
        }
    }
}
