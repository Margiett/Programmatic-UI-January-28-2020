//
//  SettingsViewController.swift
//  Programmatic-UI January 28
//
//  Created by Margiett Gil on 1/28/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

struct AppKey {
    static let appColorKey = "app color"
    static let rowkey = "row key"
}

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()
    // data for picker view
    private let colors = ["Red", "Green", "Blue", "White",]
    override func loadView() {
        view = settingsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        loadView()
        // configure delegate and datasource of pickerview
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        updateRow()
//        let colorName = colors[0] // this is hard coding
//        view.backgroundColor = UIColor(named:colorName)
      
    }
    private func updateRow() {
         if let row = UserDefaults.standard.object(forKey: AppKey.rowkey) as? Int {
            settingsView.pickerView.selectRow(row, inComponent: 0, animated: true)
             view.backgroundColor = UIColor(named: colors[row])
         } else {
             
         }
     }
    
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
        
        // save color name to user default
        
        UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
        UserDefaults.standard.set(row, forKey: AppKey.rowkey)
    }
}
