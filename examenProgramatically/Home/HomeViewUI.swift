//
//  HomeViewUI.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation
import UIKit

protocol HomeViewUIDelegate {
    
}

class HomeViewUI: UIView{
    var delegate: HomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: HomeViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
        ])
    }
}
