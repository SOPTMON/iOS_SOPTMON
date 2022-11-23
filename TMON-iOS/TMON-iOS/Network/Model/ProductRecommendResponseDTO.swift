//
//  ProductRecommendResponseDTO.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/23.
//

import Foundation

// MARK: - ProductRecommendResponseDTO
struct ProductRecommendResponseDTO: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [ProductItem]
}

// MARK: - Datum
struct ProductItem: Codable {
    let itemName: String
    let itemImage: String
    let itemPrice, discountRate, itemID: Int

    enum CodingKeys: String, CodingKey {
        case itemName, itemImage, itemPrice, discountRate
        case itemID = "itemId"
    }
}
