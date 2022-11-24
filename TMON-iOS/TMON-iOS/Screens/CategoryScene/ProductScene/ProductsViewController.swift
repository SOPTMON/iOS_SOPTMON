//
//  ProductsViewController.swift
//  TMON-iOS
//
//  Created by 정윤선 on 2022/11/18.
//

import UIKit

import SnapKit
import SwiftyColor


// MARK: - ProductsViewController

class ProductsViewController: UIViewController {
    
    // MARK: - UI Components
    
    // MARK: - navigationView UI Components
    
    private let navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let topNavigationView = UIView()
    
    private let backButton = UIButton()
    
    private let backImageView = UIImageView()
    
    private let foodLabel: UILabel = {
        let label = UILabel()
        label.text = "식품"
        label.textColor = .grayColor1
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 18)
        return label
    }()
    
    private let alarmButton = UIButton()
    
    private let alarmImageView = UIImageView()
    
    private let cartButton = UIButton()
    
    private let cartImageView = UIImageView()
    
    private let bottomNavigationView = UIView()
    
    private let entireFoodLabel: UILabel = {
        let label = UILabel()
        label.text = "전체"
        label.textColor = .mainColor
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 14)
        return label
    }()
    
    private let entireFoodLabelUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor
        return view
    }()
    
    private let freshFoodLabel: UILabel = {
        let label = UILabel()
        label.text = "신선식품"
        label.textColor = .grayColor3
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 14)
        return label
    }()
    
    private let processedFoodLabel: UILabel = {
        let label = UILabel()
        label.text = "가공식품"
        label.textColor = .grayColor3
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 14)
        return label
    }()
    
    private let healthAndDietFoodLabel: UILabel = {
        let label = UILabel()
        label.text = "건강식품/다이어트"
        label.textColor = .grayColor3
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 14)
        return label
    }()
    
    private let coffeeAndDrinksFoodLabel: UILabel = {
        let label = UILabel()
        label.text = "커피/음료"
        label.textColor = .grayColor3
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 14)
        return label
    }()
    
    // MARK: - productsScrollView UI Components
    
    private lazy var productsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let bannerImageView = UIImageView()
    
    private let recommendedProductsHeaderView = UIView()
    
    private let recommendedProductsLabel: UILabel = {
        let label = UILabel()
        label.text = "맞춤 상품 추천"
        label.textColor = .grayColor1
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 18)
        return label
    }()
    
    private let seeMoreRecommendedProductsButton = UIButton()
    
    private let seeMoreImageView = UIImageView()
    
    private lazy var recommendedProductsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Variables
    
    var recommendedProductsList: [RecommendedProductModel] = [
        RecommendedProductModel(productImage: "food_img_macaroon", productName: "[스낵위크]롯데제과 마카롱 / 60%할인",  productPrice: "19,900~"),
        RecommendedProductModel(productImage: "food_img_candy", productName: "[스낵위크] 롯데제과 캔디 묶음 상품 / 40%할인", productPrice: "7,000원~"),
        RecommendedProductModel(productImage: "food_img_chocolate", productName: "[스낵위크] 롯데제과 수제 초콜릿 / 40%할인", productPrice: "26,400원~")
    ]
    
    
    // MARK: - Constants
    
    final let recommendedProductCellHeight: CGFloat = 205
    final let recommendedProductInterItemSpacing: CGFloat = 9
    final let recommendedProductInset: UIEdgeInsets = UIEdgeInsets(top: 19, left: 16, bottom: 26, right: 16)
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImageView()
        register()
        layout()
    }
}


// MARK: - Extensions

extension ProductsViewController {
    
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [navigationView, productsScrollView].forEach {
            view.addSubview($0)
        }
        
        [topNavigationView, bottomNavigationView].forEach {
            navigationView.addSubview($0)
        }
        
        [backButton, backImageView, foodLabel, alarmButton, alarmImageView, cartButton, cartImageView].forEach {
            topNavigationView.addSubview($0)
        }
        
        [entireFoodLabel, entireFoodLabelUnderlineView, freshFoodLabel, processedFoodLabel, healthAndDietFoodLabel, coffeeAndDrinksFoodLabel].forEach {
            bottomNavigationView.addSubview($0)
        }
        
        [bannerImageView, recommendedProductsHeaderView].forEach {
            productsScrollView.addSubview($0)
        }
        
        [recommendedProductsLabel, seeMoreRecommendedProductsButton, seeMoreImageView].forEach {
            recommendedProductsHeaderView.addSubview($0)
        }
        
        // MARK: - NavigationView layout
        
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(93)
        }
        
        topNavigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(63)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(38)
            $0.height.equalTo(36)
        }
        
        backImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(38)
            $0.height.equalTo(36)
        }
        
        foodLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.centerX.equalToSuperview()
        }
        
        alarmButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalTo(self.cartButton.snp.leading)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        alarmImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalTo(self.cartButton.snp.leading)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        cartButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        cartImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        bottomNavigationView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
         
        entireFoodLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(33)
        }
        
        entireFoodLabelUnderlineView.snp.makeConstraints {
            $0.centerX.equalTo(self.entireFoodLabel.snp.centerX)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(44)
            $0.height.equalTo(2)
        }
        
        freshFoodLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.entireFoodLabel.snp.trailing).offset(27)
        }
        
        processedFoodLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.freshFoodLabel.snp.trailing).offset(18)
        }
        
        healthAndDietFoodLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.processedFoodLabel.snp.trailing).offset(18)
        }
        
        coffeeAndDrinksFoodLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.healthAndDietFoodLabel.snp.trailing).offset(18)
        }
        
        // MARK: - productsScrollView layout
        
        // ScrollView의 마지막 subview에 $0.bottom.equalToSuperview().offset(-45) 주는거 잊지말기!
        
        productsScrollView.snp.makeConstraints {
            $0.top.equalTo(self.navigationView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            // width 안줘도 되어야 하는데... 왜 안되지?
            $0.width.equalTo(394)
            $0.height.equalTo(116)
        }
        
        // MARK: - RecommendedProductsView layout
        
        recommendedProductsHeaderView.snp.makeConstraints {
            $0.top.equalTo(self.bannerImageView.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        recommendedProductsLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        seeMoreRecommendedProductsButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(22)
            $0.height.equalTo(22)
        }
        
        seeMoreImageView.snp.makeConstraints {
            $0.top.equalTo(self.bannerImageView.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(22)
            $0.height.equalTo(22)
        }
        
    }
    
    
    // MARK: - General Helpers
    
    private func configImageView() {
        backImageView.image = UIImage(named: "tmon_ios_btn_back")
        alarmImageView.image = UIImage(named: "tmon_btn_alarm")
        cartImageView.image = UIImage(named: "tmon_btn_shopping")
        bannerImageView.image = UIImage(named: "food_img_ad")
        seeMoreImageView.image = UIImage(named: "tmon_btn_more")
    }
    
    private func register() {
        recommendedProductsCollectionView.register(RecommendedProductsCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedProductsCollectionViewCell.identifier)
    }
}
