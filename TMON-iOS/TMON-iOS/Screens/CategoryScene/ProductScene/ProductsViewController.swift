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
    private let backImageContainerView = UIView()
    private let backImageView = UIImageView()
    
    private let foodLabel: UILabel = {
        let label = UILabel()
        label.text = "식품"
        label.textColor = .grayColor1
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 18)
        return label
    }()
    
    private let alarmButton = UIButton()
    private let alarmImageContainerView = UIView()
    private let alarmImageView = UIImageView()
    
    private let cartButton = UIButton()
    private let cartImageContainerView = UIView()
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
    
    private let bannerImageContainerView = UIView()
    private let bannerImageView = UIImageView()
    
    // MARK: - recommendedProductsView
    
    private let recommendedProductsHeaderView = UIView()
    
    private let recommendedProductsLabel: UILabel = {
        let label = UILabel()
        label.text = "맞춤 상품 추천"
        label.textColor = .grayColor1
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 18)
        return label
    }()
    
    private let goToRecommendedProductsPageButton = UIButton()
    private let goToRecommendedProductsPageImageContainerView = UIView()
    private let goToRecommendedProductsPageImageView = UIImageView()
    
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
    
    private let borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .grayColor4
        return view
    }()
    
    // MARK: - bestProductsView
    
    private let bestProductsHeaderView = UIView()
    
    private let bestProductsLabel: UILabel = {
        let label = UILabel()
        label.text = "베스트 상품"
        label.textColor = .grayColor1
        label.font = UIFont.font(FontName.suitSemiBold, ofSize: 18)
        return label
    }()
    
    private let goToBestProductsPageButton = UIButton()
    private let goToBestProductsPageImageContainerView = UIView()
    private let goToBestProductsPageImageView = UIImageView()
    
    private lazy var bestProductsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let seeMoreBestProductsButton: UIButton = {
        let button = UIButton()
        button.setTitle("베스트 상품 더보기 ", for: .normal)
        button.setTitleColor(.grayColor2, for: .normal)
        button.titleLabel?.font =  UIFont.font(.suitRegular, ofSize: 14)
        /*
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "tmon_btn_down", withConfiguration: imageConfig)
        button.setImage(image, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        */
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.grayColor2.cgColor
        return button
    }()
    
    private let temporaryFooter = UIView()
    
    
    // MARK: - Variables
    
    var recommendedProductsList: [RecommendedProductModel] = [
        RecommendedProductModel(productImage: "food_img_macaroon", productName: "[스낵위크]롯데제과 마카롱 / 60%할인",  productPrice: "19,900원~"),
        RecommendedProductModel(productImage: "food_img_candy", productName: "[스낵위크] 롯데제과 캔디 묶음 상품 / 40%할인", productPrice: "7,000원~"),
        RecommendedProductModel(productImage: "food_img_chocolate", productName: "[스낵위크] 롯데제과 수제 초콜릿 / 40%할인", productPrice: "26,400원~")
    ]
    
    var bestProductsList: [BestProductModel] = [
        BestProductModel(productRanking: "01", productImage: "food_img_apple", productName: "산지 직송 안동 햇사과 5kg", productPrice: "24,900원"),
        BestProductModel(productRanking: "02", productImage: "food_img_onion", productName: "국내산 무안 자색양파 미니 5kg", productPrice: "24% 7,900원"),
        BestProductModel(productRanking: "03", productImage: "food_img_chestnut", productName: "충남 공주 정안 옥광밤 4kg", productPrice: "48,900원"),
        BestProductModel(productRanking: "04", productImage: "food_img_lemon", productName: "무농약 제주 청레몬 450g (3...", productPrice: "10,900원")
    ]
    
    
    // MARK: - Constants
    
    final let recommendedProductCellHeight: CGFloat = 205
    final let recommendedProductLineSpacing: CGFloat = 9
    final let recommendedProductInset: UIEdgeInsets = UIEdgeInsets(top: 19, left: 16, bottom: 26, right: 16)
    
    final let bestProductCellHeight: CGFloat = 258
    final let bestProductLineSpacing: CGFloat = 20
    final let bestProductInterItemSpacing: CGFloat = 10
    final let bestProductInset: UIEdgeInsets = UIEdgeInsets(top: 15, left: 16, bottom: 16, right: 16)
    
    
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
        
        // MARK: - addSubview
        
        [navigationView, productsScrollView].forEach {
            view.addSubview($0)
        }
        
        [topNavigationView, bottomNavigationView].forEach {
            navigationView.addSubview($0)
        }
        
        [backButton, backImageContainerView, foodLabel, alarmButton, alarmImageContainerView, cartButton, cartImageContainerView].forEach {
            topNavigationView.addSubview($0)
        }
        
        backImageContainerView.addSubview(backImageView)
        alarmImageContainerView.addSubview(alarmImageView)
        cartImageContainerView.addSubview(cartImageView)
        
        [entireFoodLabel, entireFoodLabelUnderlineView, freshFoodLabel, processedFoodLabel, healthAndDietFoodLabel, coffeeAndDrinksFoodLabel].forEach {
            bottomNavigationView.addSubview($0)
        }
        
        [bannerImageContainerView, recommendedProductsHeaderView, recommendedProductsCollectionView, borderView, bestProductsHeaderView, bestProductsCollectionView, seeMoreBestProductsButton, temporaryFooter].forEach {
            productsScrollView.addSubview($0)
        }
        
        bannerImageContainerView.addSubview(bannerImageView)
        
        [recommendedProductsLabel, goToRecommendedProductsPageButton, goToRecommendedProductsPageImageContainerView].forEach {
            recommendedProductsHeaderView.addSubview($0)
        }
        
        goToRecommendedProductsPageImageContainerView.addSubview(goToRecommendedProductsPageImageView)
        
        [bestProductsLabel, goToBestProductsPageButton, goToBestProductsPageImageContainerView].forEach {
            bestProductsHeaderView.addSubview($0)
        }
        
        goToBestProductsPageImageContainerView.addSubview(goToBestProductsPageImageView)

        
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
        
        backImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(38)
            $0.height.equalTo(36)
        }
        
        backImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
        
        alarmImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalTo(self.cartButton.snp.leading)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        alarmImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cartButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        cartImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        
        cartImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
        
        bannerImageContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            // width 안줘도 되어야 하는데... 왜 안되지?
            $0.width.equalTo(394)
            $0.height.equalTo(116)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
        
        goToRecommendedProductsPageButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(22)
            $0.height.equalTo(22)
        }
        
        goToRecommendedProductsPageImageContainerView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(22)
            $0.height.equalTo(22)
        }
        
        goToRecommendedProductsPageImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        recommendedProductsCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.recommendedProductsHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(recommendedProductCellHeight + recommendedProductInset.top + recommendedProductInset.bottom)
        }
        
        borderView.snp.makeConstraints {
            $0.top.equalTo(self.recommendedProductsCollectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(8)
        }
        
        // MARK: - BestProductsView Layout
        
        bestProductsHeaderView.snp.makeConstraints {
            $0.top.equalTo(self.borderView.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        bestProductsLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        goToBestProductsPageButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(22)
            $0.height.equalTo(22)
        }
        
        goToBestProductsPageImageContainerView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(22)
            $0.height.equalTo(22)
        }
        
        goToBestProductsPageImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bestProductsCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.bestProductsHeaderView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(calculateBestProductsCollectionViewHeight())
        }
        
        seeMoreBestProductsButton.snp.makeConstraints {
            $0.top.equalTo(self.bestProductsCollectionView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(156)
            $0.height.equalTo(40)
        }
        
        temporaryFooter.snp.makeConstraints {
            $0.top.equalTo(self.seeMoreBestProductsButton.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-50)
        }
    }
    
    
    // MARK: - General Helpers
    
    private func configImageView() {
        backImageView.image = UIImage(named: "tmon_ios_btn_back")
        alarmImageView.image = UIImage(named: "tmon_btn_alarm")
        cartImageView.image = UIImage(named: "tmon_btn_shopping")
        bannerImageView.image = UIImage(named: "food_img_ad")
        goToRecommendedProductsPageImageView.image = UIImage(named: "tmon_btn_more")
        goToBestProductsPageImageView.image = UIImage(named: "tmon_btn_more")
    }
    
    private func register() {
        recommendedProductsCollectionView.register(RecommendedProductsCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedProductsCollectionViewCell.identifier)
        bestProductsCollectionView.register(BestProductsCollectionViewCell.self, forCellWithReuseIdentifier: BestProductsCollectionViewCell.identifier)
    }
    
    private func calculateBestProductsCollectionViewHeight() -> CGFloat {
        let count = CGFloat(bestProductsList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return (heightCount * bestProductCellHeight) + ((heightCount - 1) * bestProductLineSpacing) + bestProductInset.top + bestProductInset.bottom
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ProductsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == recommendedProductsCollectionView) {
            return CGSize(width: 134, height: 205)
        } else if (collectionView == bestProductsCollectionView) {
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - bestProductInset.left - bestProductInset.right - bestProductInterItemSpacing
            return CGSize(width: doubleCellWidth / 2, height: 258)
        } else {
            return CGSize(width: 100, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (collectionView == recommendedProductsCollectionView) {
            return recommendedProductLineSpacing
        } else if (collectionView == bestProductsCollectionView) {
            return bestProductLineSpacing
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if (collectionView == bestProductsCollectionView) {
            return bestProductInterItemSpacing
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (collectionView == recommendedProductsCollectionView) {
            return recommendedProductInset
        } else if (collectionView == bestProductsCollectionView) {
            return bestProductInset
        } else {
            return UIEdgeInsets()
        }
    }
}


// MARK: - UICollectionViewDataSource

extension ProductsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == recommendedProductsCollectionView) {
            return recommendedProductsList.count
        } else if (collectionView == bestProductsCollectionView) {
            return bestProductsList.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == recommendedProductsCollectionView) {
            guard let recommendedProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedProductsCollectionViewCell", for: indexPath)
                    as? RecommendedProductsCollectionViewCell else { return UICollectionViewCell() }
            recommendedProductCell.dataBind(model: recommendedProductsList[indexPath.item])
            return recommendedProductCell
        } else if (collectionView == bestProductsCollectionView) {
            guard let bestProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestProductsCollectionViewCell", for: indexPath) as? BestProductsCollectionViewCell else { return UICollectionViewCell() }
            bestProductCell.dataBind(model: bestProductsList[indexPath.item])
            return bestProductCell
        } else {
            return UICollectionViewCell()
        }
    }
}
