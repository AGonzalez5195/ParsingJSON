//
//  detailColorViewController.swift
//  ParsingJSONLab
//
//  Created by Anthony Gonzalez on 8/27/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit

class detailColorViewController: UIViewController {

    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    var color: ColorResults!
    
    override func viewDidLoad() {
        
        colorNameLabel.text = color.name.value
        hexLabel.text = color.hex.value
        redLabel.text = "R: \(color.rgb.fraction.r)"
        greenLabel.text = "G: \(color.rgb.fraction.g)"
        blueLabel.text = "B: \(color.rgb.fraction.b)"
    }
}
