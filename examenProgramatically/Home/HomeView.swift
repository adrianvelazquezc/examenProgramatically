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
    
    override func loadView() {
        ui = HomeViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
}

extension HomeView: HomeViewProtocol {
    
}

extension HomeView: HomeViewUIDelegate {
    
}
