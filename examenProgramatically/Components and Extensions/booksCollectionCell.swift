//
//  booksCollectionCell.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import UIKit

internal class booksCollectionCell: UICollectionViewCell {
    
    public var posterPicture: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    public static let identifier: String = "booksCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
        setupConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUIElements() {
        self.addSubview(posterPicture)
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            posterPicture.topAnchor.constraint(equalTo: topAnchor),
            posterPicture.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterPicture.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterPicture.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
