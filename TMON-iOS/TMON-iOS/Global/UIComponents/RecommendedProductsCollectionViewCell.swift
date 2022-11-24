//
//  RecommendedProductsCollectionViewCell.swift
//  TMON-iOS
//
//  Created by 정윤선 on 2022/11/24.
//

import UIKit

import SnapKit
import SwiftyColor

// MARK: - RecommendedProductsCollectionViewCell

class RecommendedProductsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "RecommendedProductsCollectionViewCell"
    
    
    // MARK: - UI Components
    
    private let productImageContainerView = UIView()
    
    private let productImageView = UIImageView()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grayColor1
        label.font = UIFont.font(FontName.suitRegular, ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grayColor1
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 14)
        return label
    }()
    
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendedProductsCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        // MARK: - addSubview
        
        [productImageContainerView, productNameLabel, productPriceLabel].forEach {
            contentView.addSubview($0)
        }
        productImageContainerView.addSubview(productImageView)
        
        // MARK: - AutoLayout
        
        productImageContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(134)
        }
        
        productImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.productImageContainerView).offset(10)
            $0.leading.equalToSuperview()
            $0.width.equalTo(125)
        }
        
        productPriceLabel.snp.makeConstraints {
            $0.top.equalTo(self.productNameLabel).offset(10)
            $0.leading.equalToSuperview()
            $0.width.equalTo(125)
        }
        
    }
    
    
    // MARK: - General Helpers
    
    func dataBind(model: RecommendedProductModel) {
        productNameLabel.text = model.productName
        productPriceLabel.text = model.productPrice
        productImageView.image = UIImage(named: model.productImage)
    }
}
