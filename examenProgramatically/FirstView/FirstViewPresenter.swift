//
//  FirstViewPresenter.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation

class FirstViewPresenter {
    var interactor: FirstViewInteractorProtocol?
    weak var view: FirstViewViewProtocol?
    var router: FirstViewRouterProtocol?
}



extension FirstViewPresenter: FirstViewPresenterProtocol {
    
}
