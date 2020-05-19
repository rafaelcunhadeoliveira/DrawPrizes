//
//  SortSuccess.swift
//  DrawPrizes
//
//  Created by Rafael Cunha de Oliveira on 2020-05-09.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit
import SwiftFireworks


protocol DismissDelegate {
    func dismiss()
}

class DrawSuccess: UIView {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sortAgainButton: UIButton!
    var delegate: DismissDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        fixSubview(loadFromNib())
    }

    func setUpResult(start: Int = 0, end: Int = 0, items: [String] = []) {
        setUpAnimation()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.fireworks()
        }
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            self.fireworks()
        }
        let randon = Int.random(in: start ... end)
        if items.isEmpty {
            resultLabel.text = String(randon)
        } else {
            let result = randon == items.count ? items.last : items[randon]
            resultLabel.text = result
        }
    }

    private func setUpAnimation() {
        sortAgainButton.alpha = 0
        UIView.animate(withDuration: 5) {
            self.sortAgainButton.alpha = 1.0
        }
    }

    private func fireworks() {
        let screenBounds = UIScreen.main.bounds
        
        let leftBounds: CGFloat = screenBounds.origin.x + 20
        let rightBounds: CGFloat = screenBounds.origin.x + screenBounds.size.width - 20.0
        let topBounds: CGFloat = screenBounds.origin.y + 20.0
        let bottomBounds: CGFloat = screenBounds.origin.y + screenBounds.size.height - 20.0
        let posX = SwiftFireworks.sharedInstance.randomCGFloat(min: leftBounds, max: rightBounds)
        let posY = SwiftFireworks.sharedInstance.randomCGFloat(min: topBounds, max: bottomBounds)
        
        SwiftFireworks.sharedInstance.showFireworkSet(inView: self,
                                                      andPosition: CGPoint(x: posX, y: posY),
                                                      numberOfFireworks: 6)
    }

    @IBAction func sortAgain(_ sender: Any) {
        delegate?.dismiss()
    }
    
}
