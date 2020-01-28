//
//  SettingsView.swift
//  Programmatic-UI January 28
//
//  Created by Margiett Gil on 1/28/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    public lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        return pv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        //add subviews
        setupPickerViewConstraints()
        
    }
    //MARK: adding constraints
    
    private func setupPickerViewConstraints(){
        //MARK: Step 1.
        addSubview(pickerView)
        //MARK: Step 2. if this line is missing the constraints wont be activated
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: Step 3. setup contraints 
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: centerYAnchor)

            ])
        
        
    }
    
}
