//
//  View+Extension.swift
//  DrawPrizes
//
//  Created by Rafael Cunha de Oliveira on 2020-05-09.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

extension UIView {

    func fixSubview(_ subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subview.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            subview.widthAnchor.constraint(equalTo: self.widthAnchor),
            subview.heightAnchor.constraint(equalTo: self.heightAnchor)
            ])
    }

    func dummyLabel(withName: String) -> UILabel {
        let label = UILabel()
        label.text = withName
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .lightGray
        return label
    }

    func loadFromNib() -> UIView {
        let nib = UINib(nibName: "\(type(of: self))", bundle: Bundle(for: type(of: self)))
        return nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
    }

    func gradientView(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
