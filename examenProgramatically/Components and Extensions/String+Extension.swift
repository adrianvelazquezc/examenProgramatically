//
//  String+Extension.swift
//  examenProgramatically
//
//  Created by Mac on 20/03/23.
//

import UIKit

public func getDecorativeTitleText(text: String, color: UIColor = .black, font: UIFont = UIFont(name: "Avenir", size: 20) ??  .systemFont(ofSize: 20, weight: .bold)) -> NSMutableAttributedString {
    
    let multipleAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.font: font
    ]
    
    let attributedString = NSMutableAttributedString(string: text, attributes: multipleAttributes)
    
    return attributedString
}

public func getDecorativeText(text: String, color: UIColor = .black, fontName: String = "Avenir", fontSize: CGFloat = 16) -> NSMutableAttributedString {
    
    let multipleAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.font: UIFont(name: fontName, size: fontSize) ?? UIFont(name: "Avenir", size: 20)
    ]
    
    let attributedString = NSMutableAttributedString(string: text, attributes: multipleAttributes)
    
    return attributedString
}
