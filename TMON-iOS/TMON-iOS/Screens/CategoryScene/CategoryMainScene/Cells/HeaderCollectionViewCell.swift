//
//  HeaderCollectionViewCell.swift
//  TMON-iOS
//
//  Created by 최효원 on 2022/11/25.
//

import UIKit

//MARK: -HeaderCollectionViewCell
class HeaderCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    static let identifier = "HeaderCollectionViewCell"
    
    //MARK: - UI Components
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grayColor2
        label.font = .systemFont(ofSize: 12.5, weight: .medium)
        return label
    }()
    
    let categoryRemoveBtn : UIButton = {
      let button = UIButton()
       button.setBackgroundImage(UIImage(named: "tmon_btn_remove"), for: .normal)
       button.contentMode = .scaleAspectFit
       return button
   }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeaderCollectionViewCell {
    private func layout() {
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.02
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.cornerRadius = contentView.frame.height / 2
        contentView.layer.masksToBounds = false
        contentView.backgroundColor = .white
        
        [categoryLabel, categoryRemoveBtn].forEach {
            contentView.addSubview($0)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
        }
        
        categoryRemoveBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(categoryLabel.snp.trailing).offset(7)
            $0.width.height.equalTo(6.5)
        }
    }
    
    //MARK: - General Helpers
    
    func dataBind(model:CategoryMainModel) {
        categoryLabel.text = model.categoryName
    }
}

