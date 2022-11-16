//
//  FontLiteral.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/16.
//


import UIKit

enum FontName: String {
    case suitSemiBold = "SUIT-SemiBold"
    case suitRegular = "SUIT-Regular"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
