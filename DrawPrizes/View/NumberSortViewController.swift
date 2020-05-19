//
//  NumberSortViewController.swift
//  Sort
//
//  Created by Rafael Cunha de Oliveira on 2020-05-09.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

class NumberSortViewController: UIViewController {

    @IBOutlet weak var startNumberTextField: UITextField!
    @IBOutlet weak var endNumberTextField: UITextField!
    @IBOutlet weak var sortButton: DrawButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardTouch()
        view.gradientView(colorTop: .black, colorBottom: .systemBlue)
    }

    @IBAction func sort(_ sender: Any) {
        self.view.endEditing(true)
        if let start = (startNumberTextField.text as NSString?)?.doubleValue,
            let end = (endNumberTextField.text as NSString?)?.doubleValue,
            end > start {
            self.tabBarController?.tabBar.isHidden = true
            let success = DrawSuccess(frame: view.frame)
            success.tag = 100
            success.gradientView(colorTop: .black, colorBottom: .green)
            success.delegate = self
            success.setUpResult(start: Int(startNumberTextField.text ?? "0") ?? 0,
                                end: Int(endNumberTextField.text ?? "0") ?? 0)
            view.addSubview(success)
        } else {
            showErrorAlert(msg: "Invalid Inputs")
        }
    }

    func reset() {
        startNumberTextField.text = ""
        endNumberTextField.text = ""
    }
    
}

extension NumberSortViewController: DismissDelegate {
    func dismiss() {
        if let success = view.viewWithTag(100) {
            reset()
            self.tabBarController?.tabBar.isHidden = false
            success.removeFromSuperview()
        }
    }
}
