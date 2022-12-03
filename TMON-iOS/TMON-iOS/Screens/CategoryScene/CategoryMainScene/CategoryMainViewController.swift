//
//  CategoryMainViewController.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/16.
//

import UIKit
import SnapKit

//MARK: - CategoryMainViewController

class CategoryMainViewController: UIViewController {
    
    //MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
       return label
    }()
    
    private let underLineView : UIView = {
        let view = UIView()
        view.backgroundColor = .grayColor2
        return view
    }()
    
    private lazy var CategoryMainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.grayColor3
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
        
    }
    
}

// MARK: - Extension

extension CategoryMainViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [titleLabel,underLineView, CategoryMainTableView].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        CategoryMainTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(50 * categoryMainData.count)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.width.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(0.2)
        }
    }
    
    //MARK: - General Helpers
    
    private func register() {
        CategoryMainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        CategoryMainTableView.register(MainTableHeaderView.self, forHeaderFooterViewReuseIdentifier: MainTableHeaderView.identifier)
        CategoryMainTableView.register(MainTableFooterView.self, forHeaderFooterViewReuseIdentifier: MainTableFooterView.identifier)
        CategoryMainTableView.register(ExpandableTableViewCell.self, forCellReuseIdentifier: ExpandableTableViewCell.identifier)
    }
}
    
    //MARK: - UITableViewDelegate

extension CategoryMainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainTableHeaderView.identifier) as? MainTableHeaderView else {
            return UIView()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 100
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainTableFooterView.identifier) as? MainTableFooterView else {
            return UIView()
        }
        
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == categoryMainData.count-1 {
            return 400
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        }else {
            return 140
        }
    }
}

//MARK: - UITableViewDataSource

extension CategoryMainViewController: UITableViewDataSource {
    
    //section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryMainData.count
    }
    
    //numberOfRowsInsection : 하나의 section안에 row 몇개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tableView Section이 펼쳐지면 Section Cell 하나에 expandable cell 1개 추가
        if categoryMainData[section].opened == true {
            return 2
        }else {
            //tableView Section이 닫혀 있을 경우에는 SectionCell 하나만 보여주면 됨
            return 1
        }
    }
    
    //cellForRowAt: UITableViewCell을 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Cell이 눌리지 않을때
        if indexPath.row == 0 {
            guard let categoryCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath)
                    as? MainTableViewCell else {return UITableViewCell() }
            categoryCell.categoryNameLabel.text = categoryMainData[indexPath.section].categoryName
            categoryCell.categoryImageView.image = UIImage(named:categoryMainData[indexPath.section].categoryIconImage)
            return categoryCell
            
            //Cell이 눌렸을 때
        }else {
            guard let expandableCell  = tableView.dequeueReusableCell(withIdentifier: ExpandableTableViewCell.identifier, for: indexPath) as? ExpandableTableViewCell else {return UITableViewCell() }
            expandableCell.allLabel.text = CategoryExpandableData[indexPath.section].all
            expandableCell.freshLabel.text = CategoryExpandableData[indexPath.section].fresh
            expandableCell.processingLabel.text = CategoryExpandableData[indexPath.section].proccessing
            expandableCell.healthLabel.text = CategoryExpandableData[indexPath.section].health
            expandableCell.coffeeLabel.text = CategoryExpandableData[indexPath.section].coffee
            return expandableCell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //셀 선택 시 회색에서 다시 변하게 해주는 것
        tableView.deselectRow(at: indexPath, animated: false)
        
        //section부분 선택하면 열리게 설정
        if indexPath.row == 0 {
            // section이 열려있다면 다시 닫힐 수 있게 해주는 코드
            categoryMainData[indexPath.section].opened = !categoryMainData[indexPath.section].opened
            
            // 모든 데이터를 새로고침하는 것이 아닌 해당하는 섹션 부분만 새로고침
            tableView.reloadSections([indexPath.section], with: .none)
            
            //sectionData 부분을 선택하면 아무 작동하지 않게 설정
        }else {
            
        }
    }
    
    
}

