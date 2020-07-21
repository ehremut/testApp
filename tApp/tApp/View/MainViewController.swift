//
//  ViewController.swift
//  tApp
//
//  Created by macOS developer on 16.07.2020.
//  Copyright © 2020 macOS developer. All rights reserved.
//

import UIKit

// MARK: - Class
class MainViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: MainPresenterProtocol!
   
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        pickerView.delegate = self
        pickerView.dataSource = self
        
                
    }
    
}


// MARK: - Extension


extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}


