//
//  CategoryMainFooterCell.swift
//  TMON-iOS
//
//  Created by 최효원 on 2022/11/18.
//

import UIKit
import SnapKit

//MARK: - CategoryMainTableFooterView
class MainTableFooterView: UITableViewHeaderFooterView {
    
    //MARK: - Identifier
    static let identifier = "MainTableFooterView"
    
    //MARK: - UI Components
    
    private let devideView: UIView = {
       let view = UIView()
        view.backgroundColor = .grayColor4
        return view
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "기획전"
        label.font = UIFont(name: "SUIT-SemiBold", size: 18)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
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
    
//    final let collectionInset: UIEdgeInsets = UIEdgeInsets(top: 24, left: 0, bottom: 40, right: 0)
        
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        register()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensions

extension MainTableFooterView {
    
    //MARK - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        
        [devideView,titleLabel,collectionView].forEach {
            contentView.addSubview($0)
        }
        
        devideView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.height.equalTo(8)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(34)
            $0.leading.equalToSuperview().offset(16)
            
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.contentView.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.contentView.safeAreaLayoutGuide).inset(140)
        }
    }
    
    //MARK: - General Helpers
    
    private func register() {
        collectionView.register(FooterCollectionViewCell.self, forCellWithReuseIdentifier: FooterCollectionViewCell.identifier)
    }
}

//MARK: - UI CollectionView DelegateFlowLayout
extension MainTableFooterView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:340, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let totalCellWidth = 340 * 3
            let totalSpacingWidth = 7 * (3 - 1)

        let leftInset = (collectionView.frame.size
            .width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset

            return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}

//MARK: - UI CollectionView DataSource

extension MainTableFooterView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryFooterData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: FooterCollectionViewCell.identifier, for: indexPath)
                as? FooterCollectionViewCell else { return UICollectionViewCell() }
        collectionCell.dataBind(model: categoryFooterData[indexPath.item])
        return collectionCell
    }
}


