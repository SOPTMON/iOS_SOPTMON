//
//  CategoryMainTableViewCell.swift
//  TMON-iOS
//
//  Created by 최효원 on 2022/11/18.
//

import UIKit
import SnapKit

//MARK: - CategoryMainTableViewCell

class MainTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "MainTableViewCell"
    
    
    //MARK: - UI Components
    
     let categoryImageContainerView : UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
     let categoryImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
     let categoryNameLabel : UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont(name: "suitRegular", size: 16)
        return title
    }()
    
     let categoryCollapsibleBtn : UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(named: "tmon_btn_collapsible"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Extensions

extension MainTableViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [categoryImageContainerView, categoryNameLabel, categoryCollapsibleBtn].forEach {
            contentView.addSubview($0)
        }
        
        categoryImageContainerView.addSubview(categoryImageView)
        
        categoryImageContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(29)
            $0.width.height.equalTo(22)
        }
        
        categoryImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        categoryNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(categoryImageContainerView.snp.trailing).offset(25)
        }
        
        categoryCollapsibleBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(29)
        }
    }
    
    //MARK: - General Helpers
    func dataBind(model: CategoryMainModel) {
        categoryImageView.image = UIImage(named: model.categoryIconImage)
        categoryNameLabel.text = model.categoryName
    }
}

