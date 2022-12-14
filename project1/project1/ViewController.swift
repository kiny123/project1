//
//  ViewController.swift
//  project1
//
//  Created by nikita on 07.12.2022.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try? fm.contentsOfDirectory(atPath: path)
        
        for item in items! {
            if item.hasPrefix("nssl") {
                // find picture to load
                pictures.append(item)
            }
        }
        print(pictures)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pictures", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

