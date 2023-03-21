//
//  FirstViewViewUI.swift
//  tabTest
//
//  Created by Mac on 20/03/23.
//

import Foundation
import UIKit

protocol FirstViewViewUIDelegate {
    
}

class FirstViewViewUI: UIView{
    var delegate: FirstViewViewUIDelegate?
    var navigationController: UINavigationController?
    var firstElementsImage = ["Book_1", "Book_2", "Book_3", "Book_1", "Book_2", "Book_3"]
    var secondElementsImage = ["Book_4", "Book_5", "Book_4", "Book_5",]
    
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
    
    lazy private var searchBarView: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Buscar"
        bar.layer.cornerRadius = 25
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.clipsToBounds = true
        bar.backgroundColor = .white
        bar.layer.borderWidth = 0.5
        if let iconView = bar.searchTextField.leftView as? UIImageView {
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = UIColor.black
        }
        bar.searchTextField.backgroundColor = .clear
        bar.layer.borderColor = UIColor.darkGray.cgColor
        return bar
    }()
    
    lazy private var firstTitle: UILabel = {
        let title = UILabel()
        title.attributedText = getDecorativeTitleText(text: "Test Text")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy private var textFieldContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var fieldTitle: UILabel = {
        let title = UILabel()
        title.attributedText = getDecorativeTitleText(text: "Lorem Ipsum")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy private var rightTitle: UILabel = {
        let title = UILabel()
        title.text = "Lorem Ipsum"
        title.font = UIFont(name: "Avenir", size: 10)
        title.textColor = .lightGray
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.5
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy private var fieldText: UILabel = {
        let title = UILabel()
        title.attributedText = getDecorativeText(text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
        title.translatesAutoresizingMaskIntoConstraints = false
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        return title
    }()
    
    lazy private var secondTitle: UILabel = {
        let title = UILabel()
        title.attributedText = getDecorativeTitleText(text: "Test Coll")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var firstCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 90, height: 120)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(booksCollectionCell.self, forCellWithReuseIdentifier: booksCollectionCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.tag = 0
        return collectionView
    }()
    
    lazy private var thirdTitle: UILabel = {
        let title = UILabel()
        title.attributedText = getDecorativeTitleText(text: "Test Coll 2")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var secondCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(booksCollectionCell.self, forCellWithReuseIdentifier: booksCollectionCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.tag = 1
        return collectionView
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: FirstViewViewUIDelegate){
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
        mainContainer.addSubview(searchBarView)
        mainContainer.addSubview(firstTitle)
        mainContainer.addSubview(textFieldContainer)
        textFieldContainer.addSubview(fieldTitle)
        textFieldContainer.addSubview(rightTitle)
        textFieldContainer.addSubview(fieldText)
        mainContainer.addSubview(secondTitle)
        mainContainer.addSubview(firstCollection)
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
            
            searchBarView.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 10),
            searchBarView.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 20),
            searchBarView.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -20),
            searchBarView.heightAnchor.constraint(equalToConstant: 50),
            
            firstTitle.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 15),
            firstTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            firstTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            textFieldContainer.topAnchor.constraint(equalTo: firstTitle.bottomAnchor, constant: 10),
            textFieldContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textFieldContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            fieldTitle.topAnchor.constraint(equalTo: textFieldContainer.topAnchor, constant: 10),
            fieldTitle.leadingAnchor.constraint(equalTo: textFieldContainer.leadingAnchor, constant: 10),
            
            rightTitle.centerYAnchor.constraint(equalTo: fieldTitle.centerYAnchor),
            rightTitle.leadingAnchor.constraint(equalTo: fieldTitle.trailingAnchor, constant: 10),
            rightTitle.widthAnchor.constraint(lessThanOrEqualToConstant: 50),
            rightTitle.trailingAnchor.constraint(equalTo: textFieldContainer.trailingAnchor, constant: -10),
            
            fieldText.topAnchor.constraint(equalTo: fieldTitle.bottomAnchor, constant: 10),
            fieldText.leadingAnchor.constraint(equalTo: fieldTitle.leadingAnchor),
            fieldText.trailingAnchor.constraint(equalTo: rightTitle.trailingAnchor),
            fieldText.bottomAnchor.constraint(equalTo: textFieldContainer.bottomAnchor, constant: -10),
            
            secondTitle.topAnchor.constraint(equalTo: textFieldContainer.bottomAnchor, constant: 15),
            secondTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            secondTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            firstCollection.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 10),
            firstCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            firstCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            firstCollection.heightAnchor.constraint(equalToConstant: 120),
            firstCollection.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -10),
        ])
    }
}
extension FirstViewViewUI: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return firstElementsImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: booksCollectionCell.identifier, for: indexPath) as! booksCollectionCell
        collection.posterPicture.image = UIImage(named: firstElementsImage[indexPath.row])
        return collection
    }
}
