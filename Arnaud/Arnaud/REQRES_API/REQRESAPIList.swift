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
        
        var completeUrl = url
        if let page = page {
            completeUrl = String(format: "%@?page=%d", url, page)
        }
        
        Alamofire.request(completeUrl).responseJSON { response in
            
            if let data = response.data {
                
                let decoder = JSONDecoder()
                
                do {
                    let page = try decoder.decode(Page.self, from: data)
                    
                    let deadlineTime = DispatchTime.now() + .seconds(1)
                    DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                        succeed?(page)
                    }
                    
                } catch {
                    failed?(APIError.decodableError)
                }
            } else {
                failed?(APIError.apiError)
            }
        }
    }
}
