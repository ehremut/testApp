//
//  PickerController.swift
//  tApp
//
//  Created by macOS developer on 18.07.2020.
//  Copyright © 2020 macOS developer. All rights reserved.
//

import UIKit

extension MainViewController: UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.variants?.variants.count ?? 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
   
}

extension MainViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         let cell = presenter.variants?.variants[row].id ?? 0
        return "id = \(cell)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.isHidden = true
        let title = presenter.variants?.variants[row].text
        let ac = UIAlertController(title: title, message: "Событие инициализировано селектором id = \(row)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}


