//
//  detailWeatherViewController.swift
//  ParsingJSONLab
//
//  Created by Anthony Gonzalez on 8/27/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit

class detailWeatherViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var currentWeather: WeatherResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
    }
    
    private func setLabelText () {
        nameLabel.text = currentWeather.name
        tempLabel.text = "\(currentWeather.main.temp) °C"
        weatherLabel.text = currentWeather.weather[0].main //Weather is in an array and only has one element (since I only specified one) so it can be accessed via index 0.
    }
}
