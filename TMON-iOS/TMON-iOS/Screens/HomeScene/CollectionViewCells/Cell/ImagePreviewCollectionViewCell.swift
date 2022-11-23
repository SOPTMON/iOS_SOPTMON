//
//  ImagePreviewCollectionViewCell.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/22.
//

import UIKit

class ImagePreviewCollectionViewCell: UICollectionViewCell {
    
    //MARK: - identifier
    static let identifier = "ImagePreviewCollectionViewCell"
    
    //MARK: - UIComponents
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setup(_ item: ListItem) {
        imageView.image = UIImage(named: item.image)
    }
    
}

extension ImagePreviewCollectionViewCell {
    
    private func addViews() {
        [imageView].forEach {
            addSubview($0)
        }
        
    }
    
    private func layout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
