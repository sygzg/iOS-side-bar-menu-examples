//
//  ViewController.swift
//  akhbel
//
//  Created by Ezgi on 13.02.2024.
//

import UIKit
import SideMenu

class ViewController: UIViewController, MenuControllerDelegate {
    private var sideMenu: SideMenuNavigationController?

    private let settingsController = SettingViewController()
    private let infoController = InfoViewController()
    private let NewspController = NewspViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuController(with: SideMenuItem.allCases)

        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        
        sideMenu?.leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        addChildControllers()
    }
    
    private func addChildControllers() {
        addChild(settingsController)
        addChild(infoController)
        addChild(NewspController)
        
        view.addSubview(settingsController.view)
        view.addSubview(infoController.view)
        view.addSubview(NewspController.view)

        
        settingsController.view.frame = view.bounds
        infoController.view.frame = view.bounds
        NewspController.view.frame = view.bounds
        
        settingsController.didMove(toParent: self)
        infoController.didMove(toParent: self)
        NewspController.didMove(toParent: self)
        
        settingsController.view.isHidden = true
        infoController.view.isHidden = true
        NewspController.view.isHidden = true
        
    }
    @IBAction func didTapMenuButton() {
        present(sideMenu!, animated: true)
    }
    func didSelectMenuItem(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: {[weak self] in
           
            self?.title = named.rawValue
            switch named {
            case .home:
                self?.settingsController.view.isHidden = true
                self?.infoController.view.isHidden = true
                self?.NewspController.view.isHidden = true
                self?.view.backgroundColor = .systemGray4

                
            case .info:
                self?.settingsController.view.isHidden = true
                self?.infoController.view.isHidden = false
                self?.NewspController.view.isHidden = false

            case .setting:
                self?.settingsController.view.isHidden = false
                self?.infoController.view.isHidden = true
                self?.NewspController.view.isHidden = true
                
            case .newsp:
                self?.settingsController.view.isHidden = true
                self?.infoController.view.isHidden = true
                self?.NewspController.view.isHidden = false

            }
        })

    }
}
