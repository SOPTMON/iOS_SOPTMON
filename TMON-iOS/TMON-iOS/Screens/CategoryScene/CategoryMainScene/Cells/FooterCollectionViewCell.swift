//
//  CategoryFooterCollectionViewCell.swift
//  TMON-iOS
//
//  Created by 최효원 on 2022/11/18.
//

import UIKit
import SnapKit

//MARK: - CategoryFooterCollectionViewCell
class FooterCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    static let identifier = "FooterCollectionViewCell"
    
    //MARK: - UI Components
    private let footerCollectionImageContainerView = UIView()
    private let footerCollectinoImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Extensions

extension FooterCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(footerCollectionImageContainerView)
        footerCollectionImageContainerView.addSubview(footerCollectinoImage)
        
        footerCollectionImageContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(340)
            $0.height.equalTo(200)
        }
        
        footerCollectinoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    //MARK: - General Helpers
    
    func dataBind(model:CategoryFooterModel) {
        footerCollectinoImage.image = UIImage(named: model.categoryFooterImage)
    }
}

