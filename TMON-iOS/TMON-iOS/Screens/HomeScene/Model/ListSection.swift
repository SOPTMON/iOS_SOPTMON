//
//  ListSection.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/22.
//

import Foundation

enum ListSection {
    
    case imagePreview([ListItem])
    case icon([ListItem])
    case productRecomment([ListItem])
    case TVONLIVE([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .imagePreview(let items),
                .icon(let items),
                .productRecomment(let items),
                .TVONLIVE(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .productRecomment:
            return "맞춤상품추천"
        case .TVONLIVE:
            return "TVON LIVE"
        default:
            return ""
        }
    }
    
}
