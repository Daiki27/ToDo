//
//  ViewController.swift
//  original apri
//
//  Created by 樋口大樹 on 2017/04/25.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import Foundation
import UIKit

extension AddViewController: UIPickerViewDelegate  {
    // UIDatePickerをdateTextFieldを追加
    func setDatePicker() {
        datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(self.changedDueDate), for: .valueChanged)
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        
        dateTextField.inputView = datePicker
    }
    
    // UIPickerViewをcategoryTextFieldを追加
    func setCategoryPicker() {
        categoryPicer = UIPickerView()
        categoryPicer.delegate = self
        categoryPicer.dataSource = self
        
        categoryTextField.inputView = categoryPicer
    }
    
    // 画面上のUIGestureRecognizerのTargetを決める
    func setGestureSeletor() {
        gestureRecognizer.addTarget(self, action: #selector(self.didSelectTapGesture))
    }
    
    // 画面を触った時に、キーボードを下げる
    func didSelectTapGesture() {
        dateTextField.resignFirstResponder()
        categoryTextField.resignFirstResponder()
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.convertCategory(selectedRow: row)
        self.category = categoryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row].category
    }
}

extension AddViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
}


extension AddViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
