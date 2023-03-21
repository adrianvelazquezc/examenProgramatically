//
//  RegisterViewUI.swift
//  inventoryProgramatically
//
//  Created by Mac on 20/03/23.
//

import UIKit

open class custom_NavigationBar: UIView {
    
    lazy private var navigationTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy private var separatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setUI()
        setConstraints()
    }
    
    init(titleText: String, textColor: UIColor = .black, navColor: UIColor = .clear, alignament: NSTextAlignment = .center) {
        super.init(frame: .zero)

        self.backgroundColor = navColor
        navigationTitle.attributedText = getDecorativeTitleText(text: titleText)
        navigationTitle.textColor = textColor
        navigationTitle.textAlignment = alignament
        
        setUI()
        setConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        self.addSubview(navigationTitle)
        self.addSubview(separatorView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            navigationTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            navigationTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            navigationTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            separatorView.topAnchor.constraint(equalTo: navigationTitle.bottomAnchor, constant: 1),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
