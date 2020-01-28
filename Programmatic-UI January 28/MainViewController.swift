//
//  ViewController.swift
//  Programmatic-UI January 28
//
//  Created by Margiett Gil on 1/28/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    // if doing programmatic UI implement and setup the view
        // in loadView()
    // loadView() gets calle dbefore viewDidLoad()
    //loadView() sets up the initial view of the controller
        // do not call super when overriding loadView()
    
    override func loadView() {
        view = mainView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // system colors are dark mood ready
        configureNavBar()
        // add target/actions for reset button
        mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_ :)), for: .touchUpInside)
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
          updateAppColor()
    }
    
    
    private func updateAppColor() {
        if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
            view.backgroundColor = UIColor(named: colorName)
        } else {
            
        }
    }
    
    
    
    private func configureNavBar(){
        //set title of navigation bar
        navigationItem.title = "Programmatic UI"
        
        // adding a UIBarButton to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_ : )))
    }
    
    @objc
    private func showSettings(_ sender: UIBarButtonItem){
        print("show settings")
        
        //MARK: Segue to the SettingsViewController
        let settingsVC = SettingsViewController()
        //present(settingVC, animated: true)
        // settingVC modalPresentationStyle = .overCurrentContext
        // settingVC.modalTransitionSyle = .flipHorizontal
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    @objc
    private func resetAppColor(_ sender: UIButton) {
        print("reset app color")
    }
    
    
}

