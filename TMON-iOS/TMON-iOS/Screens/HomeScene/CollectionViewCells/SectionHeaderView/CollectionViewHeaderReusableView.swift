//
//  CollectionViewHeaderReusableView.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/22.
//

import UIKit

class CollectionViewHeaderReusableView: UICollectionReusableView {
    
    //MARK: - identifier
    static let identifier = "CollectionViewHeaderReusableCell"
    
    //MARK: - UIComponents
    private let titleLabel = {
        let label = UILabel()
        label.textColor = .grayColor1
        label.font = UIFont.font(.suitSemiBold, ofSize: 18)
        return label
    }()
    
    private let directionImage = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.tmonBtnMore
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ title: String) {
        titleLabel.text = title
    }
    
}

extension CollectionViewHeaderReusableView {
    
    private func addViews() {
        [titleLabel, directionImage].forEach {
            addSubview($0)
        }
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.top.bottom.equalToSuperview()
        }
        
        directionImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
//            $0.top.bottom.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(16)
            $0.width.equalTo(10)
        }
    }
    
}
