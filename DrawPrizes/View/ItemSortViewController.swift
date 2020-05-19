//
//  ItemSortViewController.swift
//  DrawPrizes
//
//  Created by Rafael Cunha de Oliveira on 2020-05-09.
//  Copyright © 2020 Rafael Cunha de Oliveira. All rights reserved.
//

import UIKit

class ItemSortViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sortButton: DrawButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sortButton.isHidden = true
    }

    func setUpLayout() {
        hideKeyboardTouch()
        view.gradientView(colorTop: .black, colorBottom: .systemBlue)
        tableView.alwaysBounceVertical = false
    }
    
    @IBAction func add(_ sender: Any) {
        if let item = itemTextField.text,
            !item.isEmpty {
            names.append(item)
            countLabel.text = "Count: \(names.count)"
            tableView.reloadData()
            itemTextField.text = ""
            sortButton.isHidden = names.count < 2
        } else {
            self.showErrorAlert(msg: "Please, enter an item")
        }
    }

    @IBAction func sort(_ sender: Any) {
        self.view.endEditing(true)
        self.tabBarController?.tabBar.isHidden = true
        let success = DrawSuccess(frame: view.frame)
        success.tag = 100
        success.delegate = self
        success.gradientView(colorTop: .black, colorBottom: .systemBlue)
        success.setUpResult(start: 0, end: names.count, items: names)
        view.addSubview(success)
    }

    func reset() {
        names = []
        tableView.reloadData()
        countLabel.text = "Count: \(names.count)"
    }
}

extension ItemSortViewController: DismissDelegate {
    func dismiss() {
        if let success = view.viewWithTag(100) {
            reset()
            self.tabBarController?.tabBar.isHidden = false
            success.removeFromSuperview()
        }
    }
}

extension ItemSortViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemBlue
        let label = UILabel(frame: cell.frame)
        label.text = names[indexPath.row]
        label.textColor = .white
        cell.addSubview(label)
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            countLabel.text = "Count: \(names.count)"
        }
    }
}
