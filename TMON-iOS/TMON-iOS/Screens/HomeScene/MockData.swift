//
//  MockData.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/22.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let imagePreview: ListSection = {
        .imagePreview([
            .init(title: "", image: "home_img_ad1", cost: ""),
            .init(title: "", image: "home_img_ad2", cost: ""),
            .init(title: "", image: "home_img_ad3", cost: "")
        ])
    }()
    
    private let icon: ListSection = {
        .icon([
            .init(title: "출석/혜택", image: "home_ic_attendance", cost: ""),
            .init(title: "여행/항공권", image: "home_ic_attendance", cost: ""),
            .init(title: "E쿠폰", image: "home_ic_attendance", cost: ""),
            .init(title: "티몬무역", image: "home_ic_attendance", cost: ""),
            .init(title: "TV ON", image: "home_ic_attendance", cost: ""),
            .init(title: "식품데이", image: "home_ic_attendance", cost: ""),
            .init(title: "바로식탁", image: "home_ic_attendance", cost: ""),
            .init(title: "단하루", image: "home_ic_attendance", cost: ""),
            .init(title: "만원의행복", image: "home_ic_attendance", cost: ""),
            .init(title: "가전빅세일", image: "home_ic_attendance", cost: ""),
        ])
    }()
    
    private let productRecommend: ListSection = {
        .productRecomment([
            .init(title: "[컬쳐위크] 뮤지컬 메리셸리 / 60% 할인", image: "home_img_musical1", cost: "19,900원~"),
            .init(title: "[컬쳐위크] 뮤지컬 사랑의 불시착 / 40% 할인", image: "home_img_musical2", cost: "20,000원~"),
            .init(title: "[오저취고] 뮤지컬 인간의법정 / 40% 할인", image: "home_img_musical23", cost: "26,400원~")
            
        ])
    }()
    
    private let TVONLIVE: ListSection = {
        .TVONLIVE([
            .init(title: "LIVE ON", image: "Group 8951", cost: ""),
            .init(title: "의성마늘", image: "home_img_liveon2", cost: ""),
            .init(title: "도드람 한우", image: "home_img_liveon3", cost: ""),
            .init(title: "폰타나 스프", image: "home_img_liveon4", cost: ""),
            .init(title: "사이판 리조트", image: "home_img_liveon5", cost: "")
        ])
    }()
    
    var pageData: [ListSection] {
        [imagePreview, icon, productRecommend]
    }
    
}
