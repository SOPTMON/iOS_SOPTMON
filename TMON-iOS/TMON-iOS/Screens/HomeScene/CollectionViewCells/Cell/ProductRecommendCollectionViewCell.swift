//
//  ProductRecommendCollectionViewCell.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/22.
//

import UIKit

class ProductRecommendCollectionViewCell: UICollectionViewCell {
    
    //MARK: - identifier
    static let identifier = "ProductRecommendCollectionViewCell"
    
    //MARK: - UIComponents
    private let imageView = UIImageView()
    
    private let titleLabel = {
        let label = UILabel()
        label.textColor = .grayColor1
        label.font = UIFont.font(.suitRegular, ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let costLabel = {
        let label = UILabel()
        label.textColor = .grayColor1
        label.font = UIFont.font(.suitSemiBold, ofSize: 14)
        label.textAlignment = .left
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
        
        let title = item.title
        let length = title.count
        let textArray = title.map{ String($0) }
        
        var emphasisText = ""
        
        for i in length-6 ..< length {
            emphasisText += textArray[i]
        }
        
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (title as NSString).range(of:emphasisText))
        titleLabel.attributedText = attributedString
        
        costLabel.text = item.cost
    }
    
}

extension ProductRecommendCollectionViewCell {
    
    private func addViews() {
        [imageView, titleLabel, costLabel].forEach {
            addSubview($0)
        }
    }
    
    private func layout() {
        
        imageView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(10)
            $0.height.equalTo(133)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(11)
            $0.leading.trailing.equalTo(imageView)
            $0.height.equalTo(30)
        }
        
        costLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(titleLabel)
            $0.height.equalTo(20)
        }
        
    }
    
}
