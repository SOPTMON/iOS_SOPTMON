//
//  CategoryModel.swift
//  TMON-iOS
//
//  Created by 최효원 on 2022/11/18.
//

import Foundation

struct CategoryMainModel {
    var opened: Bool
    var categoryIconImage: String
    var categoryName: String
}

var categoryMainData: [CategoryMainModel] = [
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_clothes", categoryName: "의류"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_fashion", categoryName: "패션잡화"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_beauty", categoryName: "뷰티"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_child", categoryName: "유아"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_food", categoryName: "식품"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_kitchen", categoryName: "생활・주방"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_interior", categoryName: "가구・인테리어"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_pet", categoryName: "반려동물용품"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_book", categoryName: "도서・교육・취미"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_sports", categoryName: "스포츠"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_digital", categoryName: "가전・디지털・컴퓨터"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_car", categoryName: "자동차"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_travel", categoryName: "여행"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_coupon", categoryName: "쿠폰・상품권"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_abroad", categoryName: "해외직구"),
    CategoryMainModel(opened: false, categoryIconImage: "category_icon_show", categoryName: "공연・전시・체험")
    
]


struct CategoryFooterModel {
    let categoryFooterImage: String
}

var categoryFooterData: [CategoryFooterModel] = [
    CategoryFooterModel(categoryFooterImage: "category_img_ad2"),
    CategoryFooterModel(categoryFooterImage: "category_img_ad1"),
    CategoryFooterModel(categoryFooterImage: "category_img_ad3")
]

