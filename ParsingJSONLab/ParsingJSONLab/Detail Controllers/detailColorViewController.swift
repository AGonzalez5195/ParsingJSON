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
    
    var currentColor: ColorResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
    }
    
    private func setLabelText () {
        colorNameLabel.text = currentColor.name.value
        hexLabel.text = currentColor.hex.value
        redLabel.text = "R: \(currentColor.rgb.fraction.r)"
        greenLabel.text = "G: \(currentColor.rgb.fraction.g)"
        blueLabel.text = "B: \(currentColor.rgb.fraction.b)"
    }
}
