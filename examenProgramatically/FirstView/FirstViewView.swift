//
//  FirstViewView.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation
import UIKit

class FirstViewView: UIViewController {
    var presenter: FirstViewPresenterProtocol?
    private var ui: FirstViewViewUI?
    
    override func loadView() {
        ui = FirstViewViewUI(
            navigation: self.navigationController ?? UINavigationController(),
            delegate: self
        )
        view = ui
    }
}

extension FirstViewView: FirstViewViewProtocol {
    
}

extension FirstViewView: FirstViewViewUIDelegate {
    
}
