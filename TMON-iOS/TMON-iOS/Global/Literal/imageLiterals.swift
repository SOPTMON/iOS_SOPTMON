//
//  imageLiterals.swift
//  TMON-iOS
//
//  Created by 이태현 on 2022/11/16.
//

import UIKit

enum ImageLiterals {
    
    static var homeIcAppliances: UIImage { .load(named: "home_ic_appliances") }
    static var homeIcAttendance: UIImage { .load(named: "home_ic_attendance") }
    static var homeIcBaro: UIImage { .load(named: "home_ic_baro") }
    static var homeIcEcouponHomeIcEcoupon: UIImage { .load(named: "home_ic_ecouponhome_ic_ecoupon") }
    static var homeIcFlight: UIImage { .load(named: "home_ic_flight") }
    static var homeIcFoodday: UIImage { .load(named: "home_ic_foodday") }
    static var homeIcManwon: UIImage { .load(named: "home_ic_manwon") }
    static var homeIcOnlyone: UIImage { .load(named: "home_ic_onlyone") }
    static var homeIcTrade: UIImage { .load(named: "home_ic_trade") }
    static var homeIcTvon: UIImage { .load(named: "home_ic_tvon") }
    static var productBtnMinibutton: UIImage { .load(named: "product_btn_minibutton") }
    static var tmonBtnAlarm: UIImage { .load(named: "tmon_btn_alarm") }
    static var tmonBtnMore: UIImage { .load(named: "tmon_btn_more") }
    static var tmonBtnShopping: UIImage { .load(named: "tmon_btn_shopping") }
    static var tmoniOSBtnBack: UIImage { .load(named: "tmon_ios_btn_back") }
    
    static var tabBarCategoryDefault: UIImage { .load(named: "tabBar_categoryDefaultBar") }
    static var tabBarCategorySelected: UIImage { .load(named: "tabBar_categorySelectedBar") }
    static var tabBarHomeDefaultBar: UIImage { .load(named: "tabBar_homeDefaultBar") }
    static var tabBarHomeSelected: UIImage { .load(named: "tabBar_homeSelectedBar") }
    static var tabBarMineDefault: UIImage { .load(named: "tabBar_mineDefaultBar") }
    static var tabBarTmonDefault: UIImage { .load(named: "tabBar_tmonDefaultBar") }
    
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
