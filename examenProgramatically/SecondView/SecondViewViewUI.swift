//
//  SecondViewViewUI.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import Foundation
import UIKit

protocol SecondViewViewUIDelegate {
    
}

class SecondViewViewUI: UIView{
    var delegate: SecondViewViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: SecondViewViewUIDelegate){
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
