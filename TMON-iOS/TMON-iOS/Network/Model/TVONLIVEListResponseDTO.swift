//
//  TVONLIVEListResponseDTO.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/23.
//

import Foundation

// MARK: - TVONLIVEListResponseDTO
struct TVONLIVEListResponseDTO: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [TVListItem]
}

// MARK: - Datum
struct TVListItem: Codable {
    let liveID: Int
    let liveName: String
    let liveImage: String

    enum CodingKeys: String, CodingKey {
        case liveID = "liveId"
        case liveName, liveImage
    }
}
