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
    private let sections = MockData.shared.pageData
    
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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
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
    private func createLayout() -> UICollectionViewCompositionalLayout {

    }
    
    private func register() {
        
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
            $0.top.equalTo(categoryStackView.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .imagePreview(let items):
            return UICollectionViewCell()
        case .icon(let items):
            return UICollectionViewCell()
        case .productRecomment(let items):
            return UICollectionViewCell()
        case .TVONLIVE(let items):
            return UICollectionViewCell()
        }
    }
    
}
