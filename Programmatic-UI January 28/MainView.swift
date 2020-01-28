//
//  MainView.swift
//  Programmatic-UI January 28
//
//  Created by Margiett Gil on 1/28/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let defaultMessage = "No default color set. Please go to settings"
  
    //MARK: create a label
    public lazy var messagelabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.textAlignment = .center
        label.text = defaultMessage
//        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }() //() creates a closure and calls simultaneously
    //TODO: Sytax terminology
    
    
    
//    var someLabel: UILabel = {
//        let label = UILabel()
//        label.text = defaultMessage // DOES NOT COMPILE ALWAYS CHECK IF IS A LAZY VAR
//        return label
//    }
    
    //MARK: create a button
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        return button
    }()
    
    

      //MARK: init(frame:  ) gets called if view is done programmatically
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    // if this view get initialized from storyboard
// this initializer gets called
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit(){
        setupMessageLabel()
        setupResetButtonConstrains()
        
    }
    private func setupMessageLabel(){
        // add the message label to the mainview
        addSubview(messagelabel) // return the messageLabel that we created above
        // set constraints for the messagelabel
        messagelabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            // set top anchor 20 points from the safe area top
            messagelabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            messagelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
             // set padding at the trailing edge of the MainView
            messagelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
           
            // set horizontal contstraint center fo MainView
            
            
            // set vertical constraint center of MainView
            
            // set padding at the leading edge of the MainView
            
           
            
        ])
    }
    
    private func setupResetButtonConstrains() {
        //steps for adding constrains in code
        //MARK: 1.
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        // set constrains
        NSLayoutConstraint.activate([
        resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        resetButton.topAnchor.constraint(equalTo: messagelabel.bottomAnchor, constant: 40)
        ])
    }
}
