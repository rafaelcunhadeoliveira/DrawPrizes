//
//  SortButton.swift
//  DrawPrizes
//
//  Created by Rafael Cunha de Oliveira on 2020-05-09.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

class DrawButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        layoutIfNeeded()
        self.layer.cornerRadius = 10
        layer.borderWidth = 3
        contentMode = .scaleAspectFit
        layer.borderColor = UIColor.white.cgColor
        clipsToBounds = true
        backgroundColor = .systemBlue
        self.setTitleColor(.white, for: .normal)
        border()
    }

    func border() {
       
    }
}
