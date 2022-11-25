//
//  ExpandableTableViewCell.swift
//  TMON-iOS
//
//  Created by 최효원 on 2022/11/23.
//

import UIKit
import SnapKit

//MARK: - ExpandableTableViewCell
class ExpandableTableViewCell: UITableViewCell {
    
    //MARK: - identifier
    static let identifier = "ExpandableTableViewCell"
    
    //MARK: - UI Components
     let allLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
         label.textColor = .black
        return label
    }()
    
     let freshLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
         label.textColor = .black
        return label
    }()
    
    
     let processingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
         label.textColor = .black
        return label
    }()
    
     let healthLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
         label.textColor = .black
        return label
    }()
    
     let coffeeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ExpandableTableViewCell {
    private func layout() {
        backgroundColor = .grayColor4
        contentView.backgroundColor = .grayColor4
    
        [allLabel, freshLabel, processingLabel, healthLabel, coffeeLabel].forEach {
            contentView.addSubview($0)
        }
        
        allLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentView.safeAreaLayoutGuide).offset(18)
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(74)
        }
        freshLabel.snp.makeConstraints {
            $0.top.equalTo(allLabel.snp.top)
            $0.leading.equalTo(allLabel.snp.trailing).offset(114)
        }
        processingLabel.snp.makeConstraints {
            $0.top.equalTo(allLabel.snp.bottom).offset(18)
            $0.leading.equalTo(allLabel.snp.leading)
        }
        healthLabel.snp.makeConstraints {
            $0.top.equalTo(processingLabel.snp.top)
            $0.leading.equalTo(freshLabel.snp.leading)
        }
        coffeeLabel.snp.makeConstraints {
            $0.top.equalTo(processingLabel.snp.bottom).offset(18)
            $0.leading.equalTo(allLabel.snp.leading)
        }
        
    }
}

