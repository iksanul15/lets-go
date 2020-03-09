//
//  Helper.swift
//  Viruses
//
//  Created by zein rezky chandra on 03/03/20.
//  Copyright © 2020 Zein Rezky Chandra. All rights reserved.
//

import UIKit

extension UILabel {
    func halfTextColorChange (fullText: String, changeText: String, withColor: UIColor) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: withColor , range: range)
        self.attributedText = attribute
    }
}
