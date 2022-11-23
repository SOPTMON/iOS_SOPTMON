//
//  SectionBackgroundDecorationView.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/23.
//

import UIKit

class SectionBackgroundDecorationView: UICollectionReusableView {
    
    static let identifier = "SectionBackgroundDecorationView"
    
    private let backgroundView = {
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

extension SectionBackgroundDecorationView {
    
    private func addViews() {
        addSubview(backgroundView)
    }
    
    private func layout() {
        
        backgroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(110)
        }
        
    }
    
}
