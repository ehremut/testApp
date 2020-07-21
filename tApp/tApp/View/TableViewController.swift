//
//  TableViewController.swift
//  tApp
//
//  Created by macOS developer on 18.07.2020.
//  Copyright © 2020 macOS developer. All rights reserved.
//

import UIKit


extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.jsonData?.view.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = presenter.jsonData?.view[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pickerView.isHidden = true
        if let els = presenter.jsonData?.data, let name = presenter.jsonData?.view[indexPath.row]{
            let check = els.filter({$0.name == name}).first?.data
            let messageForUser = "Событие инициализировано \(indexPath.row + 1) строкой TableView"
            
            if let element = check as? Text{
                let ac = UIAlertController(title: element.text, message: messageForUser, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
                
            else if let element = check as? Picture{
                let ac = UIAlertController(title: element.text, message: "\(messageForUser)\n \n \n \n \n \n \n \n", preferredStyle: .alert)
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                DispatchQueue.global(qos: .utility).async {
                    self.presenter.getPicture(url: element.url)
                    guard let data = self.presenter.picture else {return}
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                ac.addImage(imageView: imageView )
                self.present(ac, animated: true)
            }
                
            else if let element = check as? Selectors {
                presenter.variants = element
                pickerView.isHidden = false
                pickerView.center = self.view.center
                self.view.addSubview(pickerView)
            }
        }
    }
}

