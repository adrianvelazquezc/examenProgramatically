//
//  HomePresenter.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation

class HomePresenter {
    var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
}



extension HomePresenter: HomePresenterProtocol {
    
}
