//
//  HomeViewController.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/16.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {

    //MARK: Data
    private let shared = MockData.shared
    
    //MARK: - UIComponents
    private let logoImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home_ic_home")
        return imageView
    }()
    
    private var textFieldContainerView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    private var textFieldImage = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Subtract")
        return imageView
    }()
    
    private let searchTextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let alarmImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.tmonBtnAlarm
        return imageView
    }()
    
    private let shoppintimageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.tmonBtnShopping
        return imageView
    }()
    
    private let categoryStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let homeLabel = {
        let label = UILabel()
        label.text = "홈"
        label.textColor = .mainColor
        label.font = UIFont.font(.suitRegular, ofSize: 14)
        return label
    }()
    
    private let underHomeLabel = {
        let label = UILabel()
        label.backgroundColor = .mainColor
        return label
    }()
    
    private let monsterDayLabel = {
        let label = UILabel()
        label.text = "몬스터데이"
        label.textColor = .black
        label.font = UIFont.font(.suitRegular, ofSize: 14)
        return label
    }()
    
    private let bestLabel = {
        let label = UILabel()
        label.text = "베스트"
        label.textColor = .black
        label.font = UIFont.font(.suitRegular, ofSize: 14)
        return label
    }()
    
    private let brandLabel = {
        let label = UILabel()
        label.text = "브랜드"
        label.textColor = .black
        label.font = UIFont.font(.suitRegular, ofSize: 14)
        return label
    }()
    
    private let directPurchaseLabel = {
        let label = UILabel()
        label.text = "해외직구"
        label.textColor = .black
        label.font = UIFont.font(.suitRegular, ofSize: 14)
        return label
    }()
    
    private let beverageLabel = {
        let label = UILabel()
        label.text = "커피/음료"
        label.textColor = .black
        label.font = UIFont.font(.suitRegular, ofSize: 14)
        return label
    }()
    
    private lazy var containerCollectionView = {
        let layout = createLayout()
        layout.register(SectionBackgroundDecorationView.self, forDecorationViewOfKind: SectionBackgroundDecorationView.identifier)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetting()
        addViews()
        layout()
        register()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.textFieldContainerView.frame.size)
        gradient.colors = [UIColor.gradient.cgColor, UIColor.mainColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let shape = CAShapeLayer()
        shape.lineWidth = 3
        shape.path = UIBezierPath(roundedRect: textFieldContainerView.bounds, cornerRadius: 15).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        self.textFieldContainerView.layer.addSublayer(gradient)
    }
    
    //MARK: - Method
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(20)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    
    }
    
    private func supplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .absolute(view.frame.width), heightDimension: .absolute(42)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
    }
    
    private func register() {
        containerCollectionView.register(CollectionViewHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeaderReusableView.identifier)
        containerCollectionView.register(CollectionViewFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewFooterReusableView.identifier)
        containerCollectionView.register(ImagePreviewCollectionViewCell.self, forCellWithReuseIdentifier: ImagePreviewCollectionViewCell.identifier)
        containerCollectionView.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: IconCollectionViewCell.identifier)
        containerCollectionView.register(ProductRecommendCollectionViewCell.self, forCellWithReuseIdentifier: ProductRecommendCollectionViewCell.identifier)
        containerCollectionView.register(TVONLIVECollectionViewCell.self, forCellWithReuseIdentifier: TVONLIVECollectionViewCell.identifier)
    }
    
    private func fetchData() {
        HomeViewAPIService.requestProductReccomendLists { [weak self] result in
            switch result {
            case .success(let data):
                self?.shared.productRecommend = {
                    .productRecomment([
                        .init(title: data[0].itemName, image: data[0].itemImage, cost: String(data[0].itemPrice)),
                        .init(title: data[1].itemName, image: data[1].itemImage, cost: String(data[1].itemPrice)),
                        .init(title: data[2].itemName, image: data[2].itemImage, cost: String(data[2].itemPrice)),
                        .init(title: data[3].itemName, image: data[3].itemImage, cost: String(data[3].itemPrice))
                    ])
                }()
                self?.containerCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
        HomeViewAPIService.requestTVONLists { [weak self] result in
            switch result {
            case .success(let data):
                self?.shared.TVONLIVE = {
                    .TVONLIVE([
                        .init(title: data[0].liveName, image: data[0].liveImage, cost: ""),
                        .init(title: data[1].liveName, image: data[1].liveImage, cost: ""),
                        .init(title: data[2].liveName, image: data[2].liveImage, cost: ""),
                        .init(title: data[3].liveName, image: data[3].liveImage, cost: ""),
                        .init(title: data[4].liveName, image: data[4].liveImage, cost: "")
                    ])
                }()
                self?.containerCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension HomeViewController {
    
    private func initialSetting() {
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func addViews() {
        
        [textFieldImage, searchTextField].forEach {
            textFieldContainerView.addSubview($0)
        }
        
        [homeLabel, monsterDayLabel, bestLabel, brandLabel, directPurchaseLabel, beverageLabel].forEach {
            categoryStackView.addArrangedSubview($0)
        }
        
        [logoImageView, textFieldContainerView, alarmImageView, shoppintimageView, categoryStackView, underHomeLabel, containerCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    private func layout() {
        
        logoImageView.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.width.height.equalTo(30)
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        textFieldContainerView.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
            $0.trailing.equalTo(alarmImageView.snp.leading).offset(-20)
            $0.height.equalTo(32)
        }
        
        textFieldImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.width.height.equalTo(10)
            $0.centerY.equalToSuperview()
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(3)
            $0.leading.equalTo(textFieldImage.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        shoppintimageView.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerY.equalTo(logoImageView)
            $0.height.width.equalTo(28)
        }
        
        alarmImageView.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.width.height.equalTo(28)
            $0.trailing.equalTo(shoppintimageView.snp.leading).offset(-5)
        }
        
        categoryStackView.snp.makeConstraints {
            $0.top.equalTo(textFieldContainerView.snp.bottom).offset(30)
            $0.leading.equalTo(logoImageView)
            $0.trailing.equalTo(shoppintimageView)
            $0.height.equalTo(16)
        }
        
        underHomeLabel.snp.makeConstraints {
            $0.centerX.equalTo(homeLabel)
            $0.width.equalTo(30)
            $0.height.equalTo(4)
            $0.top.equalTo(homeLabel.snp.bottom).offset(7)
        }
        
        containerCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(underHomeLabel.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section = self.shared.pageData[sectionIndex]
            switch section {
            case .imagePreview:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.5)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 17, leading: 10, bottom: 30, trailing: 10)
                return section
            case .icon:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2)),
                                                                 subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 18
                section.contentInsets = .init(top: 0, leading: 23, bottom: 26, trailing: 23)
                section.boundarySupplementaryItems = [self.supplementaryFooterItem()]
                return section
            case .productRecomment:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .absolute(150), heightDimension: .absolute(150)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(150), heightDimension: .absolute(180)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 10, leading: 10, bottom: 50, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                return section
            case .TVONLIVE:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(90), heightDimension: .absolute(100)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 5
                section.contentInsets = .init(top: 23, leading: 10, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.decorationItems = [NSCollectionLayoutDecorationItem.background(elementKind: SectionBackgroundDecorationView.identifier)]
                return section
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return shared.pageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shared.pageData[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch shared.pageData[indexPath.section] {
        case .imagePreview(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagePreviewCollectionViewCell.identifier, for: indexPath) as! ImagePreviewCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        case .icon(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconCollectionViewCell.identifier, for: indexPath) as! IconCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        case .productRecomment(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductRecommendCollectionViewCell.identifier, for: indexPath) as! ProductRecommendCollectionViewCell
            cell.setup(items[indexPath.row])
            return cell
        case .TVONLIVE(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVONLIVECollectionViewCell.identifier, for: indexPath) as! TVONLIVECollectionViewCell
            cell.setup(items[indexPath.row], indexPath.row)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeaderReusableView.identifier, for: indexPath) as! CollectionViewHeaderReusableView
            header.setup(shared.pageData[indexPath.section].title)
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewFooterReusableView.identifier, for: indexPath) as! CollectionViewFooterReusableView
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
}
