//
//  ViewController+Extension.swift
//  DrawPrizes
//
//  Created by Rafael Cunha de Oliveira on 2020-05-09.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlert(msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler:nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    func hideKeyboardTouch() {
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}
