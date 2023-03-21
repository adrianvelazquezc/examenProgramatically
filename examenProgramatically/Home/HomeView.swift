//
//  HomeView.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    var presenter: HomePresenterProtocol?
    private var ui: HomeViewUI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        let tabBar = UITabBarController()
        let firstVC = FirstViewMain.createModule(navigation: self.navigationController ?? UINavigationController())
        let secondVC = SecondViewMain.createModule(navigation: self.navigationController ?? UINavigationController())
        
        if let storeImage = UIImage(named: "Store") {
            firstVC.tabBarItem = UITabBarItem(title: "", image: storeImage.withRenderingMode(.alwaysTemplate), tag: 0)
        }

        if let profileImage = UIImage(named: "Profile") {
            secondVC.tabBarItem = UITabBarItem(title: "", image: profileImage.withRenderingMode(.alwaysTemplate), tag: 1)
        }
        tabBar.tabBar.tintColor = .black
        tabBar.tabBar.unselectedItemTintColor = .lightGray
        tabBar.setViewControllers([firstVC, secondVC], animated: true)
        addChild(tabBar)
        self.view.addSubview(tabBar.view)
        tabBar.didMove(toParent: self)
        
        addTopLine(to: tabBar.tabBar)
    }
    
    private func addTopLine(to view: UIView) {
        let line = CALayer()
        line.backgroundColor = UIColor.lightGray.cgColor
        line.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 1)
        view.layer.addSublayer(line)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}

extension HomeView: HomeViewProtocol {
    
}

extension HomeView: HomeViewUIDelegate {
    
}
