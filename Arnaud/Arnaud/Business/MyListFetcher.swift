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
    var currentPage: Int
    var pages: [Page]
    var total_pages: Int
    
    init(fetcher: APIListFetcherProtocol) {
        
        self.fetcher = fetcher
        
        currentPage = 1
        pages = []
        total_pages = 0
    }
    
    func start() {
        
        self.fetcher.fetchList(in: currentPage, succeed: { [unowned self] (page) in
            
            self.addNewPage(page)
            self.total_pages = page.total_pages
        }) { (error) in
            
            print("Debug : APIError : ", error.localizedDescription)
        }
    }
    
    func next() {
        
        self.fetcher.fetchList(in: currentPage, succeed: { [unowned self] (page) in
            
            self.addNewPage(page)
            self.nextIfNeeded()
        }) { (error) in
            
            print("Debug : APIError : ", error.localizedDescription)
        }
    }
    
    private func nextIfNeeded() {
        
        if currentPage <= total_pages {
            
            self.next()
        }
    }
    
    private func addNewPage(_ page: Page) {
        
        currentPage = currentPage + 1
        pages.append(page)
        delegate?.didDownloadNewPage(for: self.pages.count - 1)
    }
}
