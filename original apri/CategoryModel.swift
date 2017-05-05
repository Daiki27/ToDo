//
//  ViewController.swift
//  original apri
//
//  Created by 樋口大樹 on 2017/04/25.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class CategoryModel: Object {
    
    static let realm = try! Realm()
    
    dynamic private var id: Int = 0 // CategoryModelのid
    dynamic var category: String = "" // Categoryの内容
    
    let todoModel = List<ToDoModel>()
    
    // idをプライマリーキーに設定
    override static func primaryKey() -> String {
        return "id"
    }
    
    // 新しいCategoryのデータを作成するためのメソッド
    static func create(newCategory text: String) -> CategoryModel {
        // インスタンスを生成
        let category = CategoryModel()
        // それぞれにデータをいれる
        category.id = lastId()
        category.category = text
        
        return category
    }
    
    // データを更新するためのメソッド
    static func update(model: CategoryModel, content: String) {
        // ローカルのdefault.realmとのtransactionを生成
        try! realm.write {
            // categoryに内容を挿入
            model.category = content
        }
    }
    
    // idを取得するためのメソッド
    static func lastId() -> Int {
        // idの最大値を取得してから、+1して返す
        if let category = realm.objects(CategoryModel.self).sorted(byKeyPath: "id", ascending: false).first {
            return category.id + 1
        }else {
            return 1
        }
    }
    
    // 作成したデータを保存するためのメソッド
    func save() {
        // ローカルのdefault.realmとのtransactionを生成
        try! CategoryModel.realm.write{
            // データを追加
            CategoryModel.realm.add(self)
        }
    }
    
    // データを全件取得
    static func loadAll() -> [CategoryModel] {
        // idでソートして全件取得
        let categories = realm.objects(CategoryModel.self).sorted(byKeyPath: "id", ascending: true)
        // 取得したデータを配列に入れる
        var array: [CategoryModel] = []
        for category in categories {
            array.append(category)
        }
        return array
    }
}
