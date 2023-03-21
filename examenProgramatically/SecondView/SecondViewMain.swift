//
//  SecondViewMain.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation
import UIKit

open class SecondViewMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: SecondViewView? = SecondViewView()
        if let view = viewController {
            let presenter = SecondViewPresenter()
            let router = SecondViewRouter()
            let interactor = SecondViewInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}
