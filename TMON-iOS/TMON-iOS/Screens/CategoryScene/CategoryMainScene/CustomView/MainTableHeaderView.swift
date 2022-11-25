//
//  MainTableHeaderView.swift
//  TMON-iOS
//
//  Created by 최효원 on 2022/11/25.
//

import UIKit

class MainTableHeaderView: UITableViewHeaderFooterView {

    //MARK: - Identifier
    static let identifier = "MainTableHeaderView"
    
    //MARK: - UI Components
    
    private let recentCategoryButton: UIButton = {
       let button = UIButton()
        button.setTitle("최근 본 카테고리", for: .normal)
        button.setTitleColor(.mainColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12.5, weight: .medium)
        return button
    }()
    
    private let devideLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .black
        return label
    }()
    
    private let pickCategoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("찜한 카테고리", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12.5, weight: .medium)
        button.setTitleColor(.grayColor2, for: .normal)
        return button
    }()
    
    private lazy var headerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
        
    }()
    
        
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        register()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainTableHeaderView {
    private func layout() {
        contentView.backgroundColor = .grayColor4
        
        [recentCategoryButton, devideLabel, pickCategoryButton, headerCollectionView].forEach{
            contentView.addSubview($0)
        }
        
        devideLabel.snp.makeConstraints {
            $0.top.equalTo(recentCategoryButton.snp.top)
            $0.centerX.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.width.equalTo(1.5)
            $0.height.equalTo(12)
        }
        
        recentCategoryButton.snp.makeConstraints{
            $0.top.equalTo(self.contentView.safeAreaLayoutGuide).offset(14)
            $0.trailing.equalTo(devideLabel.snp.leading).offset(-9)
            $0.width.equalTo(83)
            $0.height.equalTo(18)
        }
        
        pickCategoryButton.snp.makeConstraints {
            $0.top.equalTo(recentCategoryButton.snp.top)
            $0.leading.equalTo(devideLabel.snp.trailing).offset(9)
            $0.width.equalTo(69)
            $0.height.equalTo(18)
        }
        
        headerCollectionView.snp.makeConstraints {
            $0.top.equalTo(recentCategoryButton.snp.bottom).offset(20)
            $0.leading.equalTo(self.contentView.safeAreaLayoutGuide).offset(17)
            $0.trailing.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview().inset(18)
        }
    }
    
    //MARK: - General Helpers
    
    private func register() {
        headerCollectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: HeaderCollectionViewCell.identifier)
    }
}

//MARK: - UI CollectionView DelegateFlowLayout
extension MainTableHeaderView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoryMainData[indexPath.item].categoryName.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 32.5, height: 30)
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

//MARK: - UI CollectionView DataSource

extension MainTableHeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryMainData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = headerCollectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.identifier, for: indexPath)
                as? HeaderCollectionViewCell else { return UICollectionViewCell() }
        collectionCell.dataBind(model: categoryMainData[indexPath.item])
        return collectionCell
    }
}


