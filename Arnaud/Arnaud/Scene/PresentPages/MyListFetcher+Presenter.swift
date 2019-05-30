//
//  MyListFetcher+Presenter.swift
//  Arnaud
//
//  Created by Arnaud Verrier on 30/05/2019.
//  Copyright © 2019 Arnaud Verrier. All rights reserved.
//

import UIKit

extension MyListFetcher: PagePresenter {
    
    func numberOfPage() -> Int {
        
        return pages.count
    }
    
    func numberOfColorInPage(no number: Int) -> Int {
        
        return pages[number].data.count
    }
    
    func colorAtIndexPath(_ indexPath: IndexPath) -> UIColor {
        
        let defaultColor: UIColor = .gray
        
        guard
            pages.count > indexPath.section,
            pages[indexPath.section].data.count > indexPath.row else {
                return defaultColor
        }
        
        let color = pages[indexPath.section].data[indexPath.row]
        
        return hexStringToUIColor(hex: color.color)
    }
    
    private func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
