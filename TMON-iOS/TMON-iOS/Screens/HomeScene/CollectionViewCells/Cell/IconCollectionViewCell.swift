//
//  IconCollectionViewCell.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/22.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    //MARK: - identifier
    static let identifier = "IconCollectionViewCell"
    
    //MARK: - UIComponents
    private let imageView = UIImageView()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = UIFont.font(.suitRegular, ofSize: 10)
        label.textColor = .grayColor1
        return label
    }()
    
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
        titleLabel.text = item.title
    }
    
}

extension IconCollectionViewCell {
    
    private func addViews() {
        [imageView, titleLabel].forEach {
            addSubview($0)
        }
    }
    
    private func layout() {
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(43)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.centerX.equalTo(imageView)
            $0.bottom.equalToSuperview()
        }
    }
    
}
