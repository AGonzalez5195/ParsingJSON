//
//  ColorViewController.swift
//  ParsingJSONLab
//
//  Created by Anthony Gonzalez on 8/27/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    var colors = [ColorResults]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.dataSource = self
        super.viewDidLoad()
        loadData()

    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "color", ofType: "json") else {
            fatalError("Couldn't find json file")
        }
      
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let colorsFromJSON = try ColorResults.getColors(from: data)
            colors = colorsFromJSON
        } catch {
            fatalError("\(error)")
        }
    }
}

extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let redValue = CGFloat(colors[indexPath.row].rgb.fraction.r)
        let greenValue = CGFloat(colors[indexPath.row].rgb.fraction.g)
        let blueValue = CGFloat(colors[indexPath.row].rgb.fraction.b)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell")
        cell?.textLabel?.text = colors[indexPath.row].name.value
        cell?.textLabel?.textColor = .white
        cell?.detailTextLabel?.textColor = .white
        cell?.detailTextLabel?.text = colors[indexPath.row].hex.value
        cell?.backgroundColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        return cell!
    }
}
