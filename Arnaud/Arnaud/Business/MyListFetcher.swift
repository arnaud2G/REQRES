//
//  MyListFetcher.swift
//  Arnaud
//
//  Created by Arnaud Verrier on 30/05/2019.
//  Copyright © 2019 Arnaud Verrier. All rights reserved.
//

import Foundation

protocol APIListFetcherProtocol {
    
    var url: String { get }
    func fetchList(in page: Int?, succeed: ((_ page: Page) -> Void)?, failed: ((_ error: Error) -> Void)?)
}

protocol ListFetcherDelegate: class {
    
    func didDownloadNewPage(for section: Int)
}

class MyListFetcher {
    
    weak var delegate: ListFetcherDelegate?
    
    let fetcher: APIListFetcherProtocol
    var currentPage = 0
    var pages: [Page] = []
    
    init(fetcher: APIListFetcherProtocol) {
        
        self.fetcher = fetcher
    }
    
    func start() {
        
        self.fetcher.fetchList(in: currentPage, succeed: { [unowned self] (page) in
            
            self.addNewPage(page)
        }) { (error) in
            
            print("Debug : APIError : ", error.localizedDescription)
        }
    }
    
    private func addNewPage(_ page: Page) {
        
        self.pages.append(page)
        self.delegate?.didDownloadNewPage(for: self.pages.count - 1)
    }
}
