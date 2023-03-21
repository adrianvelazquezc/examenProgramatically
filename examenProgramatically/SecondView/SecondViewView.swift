//
//  SecondViewView.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation
import UIKit

class SecondViewView: UIViewController {
    var presenter: SecondViewPresenterProtocol?
    private var ui: SecondViewViewUI?
    
    override func loadView() {
        ui = SecondViewViewUI(
            navigation: self.navigationController ?? UINavigationController(),
            delegate: self
        )
        view = ui
    }
}

extension SecondViewView: SecondViewViewProtocol {
    
}

extension SecondViewView: SecondViewViewUIDelegate {
    
}
