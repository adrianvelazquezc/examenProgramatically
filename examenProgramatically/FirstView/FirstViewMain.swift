//
//  FirstViewMain.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation
import UIKit

open class FirstViewMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: FirstViewView? = FirstViewView()
        if let view = viewController {
            let presenter = FirstViewPresenter()
            let router = FirstViewRouter()
            let interactor = FirstViewInteractor()
            
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
