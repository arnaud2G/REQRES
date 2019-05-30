//
//  PresentPagesViewController.swift
//  Arnaud
//
//  Created by Arnaud Verrier on 30/05/2019.
//  Copyright © 2019 Arnaud Verrier. All rights reserved.
//

import UIKit

protocol PagePresenter {
    
    func numberOfPage() -> Int
    func numberOfColorInPage(no number: Int) -> Int
    func colorAtIndexPath(_ indexPath: IndexPath) -> UIColor
}

class PresentPagesViewController: UICollectionViewController, ListFetcherDelegate {
    
    var fetcher: MyListFetcher
    var model: PagePresenter
    
    init(fetcher: MyListFetcher) {
        
        self.fetcher = fetcher
        self.model = fetcher
        
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        
        self.fetcher.delegate = self
        self.collectionView.backgroundColor = .yellow
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetcher.next()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Not needed here")
    }
    
    func didDownloadNewPage(for section: Int) {
        self.collectionView.reloadData()
    }
}

extension PresentPagesViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return model.numberOfPage()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(model.numberOfColorInPage(no: section))
        
        return model.numberOfColorInPage(no: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = model.colorAtIndexPath(indexPath)
        return cell
    }
}
