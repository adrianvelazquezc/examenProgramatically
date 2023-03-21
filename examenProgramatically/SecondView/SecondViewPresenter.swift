//
//  SecondViewPresenter.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation

class SecondViewPresenter {
    var interactor: SecondViewInteractorProtocol?
    weak var view: SecondViewViewProtocol?
    var router: SecondViewRouterProtocol?
}



extension SecondViewPresenter: SecondViewPresenterProtocol {
    
}
