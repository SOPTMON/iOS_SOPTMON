//
//  TVONLIVECollectionViewCell.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/22.
//

import UIKit

class TVONLIVECollectionViewCell: UICollectionViewCell {
    
    //MARK: - identifier
    static let identifier = "TVONLIVECollectionViewCell"
    
    //MARK: - UIComponents
    private let imageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.layer.cornerRadius = 33
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.font(.suitRegular, ofSize: 12)
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
    
    func setup(_ item: ListItem,_ index: Int) {
        imageView.kf.setImage(with: URL(string: item.image))
        titleLabel.text = item.title
        titleLabel.textColor = index == 0 ? .mainColor : .grayColor2
    }
    
}

extension TVONLIVECollectionViewCell {
    
    private func addViews() {
        [imageView, titleLabel].forEach {
            addSubview($0)
        }
    }
    
    private func layout() {
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(70)
            
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
    }
    
}
