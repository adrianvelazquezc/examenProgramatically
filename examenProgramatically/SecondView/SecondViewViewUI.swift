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
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var navigationTitle: custom_NavigationBar = {
        let title = custom_NavigationBar(titleText: "Home")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var userMailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                     NSAttributedString.Key.font: UIFont(name: "Avenir", size: 20)]
        let placeholderText = "Correo Electronico"
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        return textField
    }()
    
    private lazy var userPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                                     NSAttributedString.Key.font: UIFont(name: "Avenir", size: 20)]
        let placeholderText = "Contraseña"
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        return textField
    }()
    
    lazy private var forgotLabel: UILabel = {
        let title = UILabel()
        title.attributedText = getDecorativeText(text: "¿Olvidaste Tu contraseña?")
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .right
        return title
    }()
    
    lazy private var createLabel: UILabel = {
        let title = UILabel()
        title.attributedText = getDecorativeText(text: "Crear cuenta", fontSize: 18)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        return title
    }()
    
    lazy private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Ingresar", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        return button
    }()
    
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
        self.addSubview(navigationTitle)
        self.addSubview(scrollView)
        scrollView.addSubview(mainContainer)
        mainContainer.addSubview(userMailTextField)
        mainContainer.addSubview(userPasswordTextField)
        mainContainer.addSubview(forgotLabel)
        mainContainer.addSubview(createLabel)
        mainContainer.addSubview(loginButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            navigationTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: navigationTitle.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            mainContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainContainer.widthAnchor.constraint(equalTo: self.widthAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            userMailTextField.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 20),
            userMailTextField.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 20),
            userMailTextField.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -20),
            userMailTextField.heightAnchor.constraint(equalToConstant: 55),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userMailTextField.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 20),
            userPasswordTextField.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -20),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 55),
            
            forgotLabel.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 20),
            forgotLabel.leadingAnchor.constraint(equalTo: userPasswordTextField.leadingAnchor),
            forgotLabel.trailingAnchor.constraint(equalTo: userPasswordTextField.trailingAnchor),
            
            createLabel.topAnchor.constraint(equalTo: forgotLabel.bottomAnchor, constant: 20),
            createLabel.leadingAnchor.constraint(equalTo: userPasswordTextField.leadingAnchor),
            createLabel.trailingAnchor.constraint(equalTo: userPasswordTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: userPasswordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: userPasswordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}
