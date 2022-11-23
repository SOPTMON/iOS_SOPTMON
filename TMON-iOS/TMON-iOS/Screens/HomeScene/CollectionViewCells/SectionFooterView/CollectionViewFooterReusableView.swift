//
//  CollectionViewFooterReusableView.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/23.
//

import UIKit

class CollectionViewFooterReusableView: UICollectionReusableView {
        
    static let identifier = "CollectionViewFooterReusableView"
    
    private let view = {
        let view = UIView()
        view.backgroundColor = .grayColor4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CollectionViewFooterReusableView {
    
    private func addViews() {
        addSubview(view)
    }
    
    private func layout() {
        view.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(8)
        }
    }
    
}
