//
//  ViewController.swift
//  Arnaud
//
//  Created by Arnaud Verrier on 30/05/2019.
//  Copyright © 2019 Arnaud Verrier. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ListFetcherDelegate {
    
    var fetcher: MyListFetcher?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = "https://reqres.in/api/list"
        let api = REQRESAPIList(url: url)
        
        self.fetcher = MyListFetcher(fetcher: api)
        
        fetcher!.delegate = self
        fetcher!.start()
    }
    
    func didDownloadNewPage(for section: Int) {
        
        let presentPagesViewController = PresentPagesViewController(fetcher: fetcher!)
        self.navigationController?.pushViewController(presentPagesViewController, animated: false)
    }
}

