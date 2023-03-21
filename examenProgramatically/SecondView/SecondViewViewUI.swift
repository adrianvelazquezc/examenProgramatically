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
    let mediaArray = ["Icon_Facebook", "Icon_Apple", "Icon_Google"]
    
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
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes as [NSAttributedString.Key : Any])
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
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes as [NSAttributedString.Key : Any])
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
    
    lazy private var firstSeparatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var separatorLabel: UILabel = {
        let title = UILabel()
        title.attributedText = getDecorativeText(text: "ó")
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .right
        return title
    }()
    
    lazy private var secondSeparatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var imageStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 15
        stack.distribution = .fillProportionally
        return stack
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
        self.addSubview(userMailTextField)
        self.addSubview(userPasswordTextField)
        self.addSubview(forgotLabel)
        self.addSubview(createLabel)
        self.addSubview(loginButton)
        self.addSubview(firstSeparatorView)
        self.addSubview(separatorLabel)
        self.addSubview(secondSeparatorView)
        self.addSubview(imageStack)
        for images in 0...mediaArray.count-1 {
            let mediaPicture: UIImageView = {
                let image = UIImageView()
                image.translatesAutoresizingMaskIntoConstraints = false
                image.contentMode = .scaleAspectFit
                image.clipsToBounds = true
                image.image = UIImage(named: mediaArray[images])
                return image
            }()
            imageStack.addArrangedSubview(mediaPicture)
        }
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            navigationTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userMailTextField.topAnchor.constraint(equalTo: navigationTitle.bottomAnchor, constant: 20),
            userMailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            userMailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            userMailTextField.heightAnchor.constraint(equalToConstant: 55),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userMailTextField.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: userMailTextField.leadingAnchor),
            userPasswordTextField.trailingAnchor.constraint(equalTo: userMailTextField.trailingAnchor),
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
            
            separatorLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            separatorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            firstSeparatorView.centerYAnchor.constraint(equalTo: separatorLabel.centerYAnchor),
            firstSeparatorView.leadingAnchor.constraint(equalTo: userPasswordTextField.leadingAnchor, constant: 10),
            firstSeparatorView.trailingAnchor.constraint(equalTo: separatorLabel.leadingAnchor, constant: -5),
            firstSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            secondSeparatorView.centerYAnchor.constraint(equalTo: separatorLabel.centerYAnchor),
            secondSeparatorView.leadingAnchor.constraint(equalTo: separatorLabel.trailingAnchor, constant: 5),
            secondSeparatorView.trailingAnchor.constraint(equalTo: userPasswordTextField.trailingAnchor, constant: -10),
            secondSeparatorView.heightAnchor.constraint(equalToConstant: 1),
            
            
            imageStack.topAnchor.constraint(equalTo: separatorLabel.bottomAnchor, constant: 20),
            imageStack.leadingAnchor.constraint(equalTo: userPasswordTextField.leadingAnchor, constant: 20),
            imageStack.trailingAnchor.constraint(equalTo: userPasswordTextField.trailingAnchor, constant: -20),
            imageStack.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}
