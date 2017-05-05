//
//  ViewController.swift
//  original apri
//
//  Created by 樋口大樹 on 2017/04/25.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit

extension Date {
    // DateをString型に変換
    func convertDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.string(from: self)
    }
}
