//
//  detailUserViewController.swift
//  ParsingJSONLab
//
//  Created by Anthony Gonzalez on 8/27/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit

class detailUserViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    var currentUser: userResults!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
    }
    
    private func setLabelText () {
        userLabel.text = currentUser.name.first.capitalized
        var currentUsersDOB = currentUser.dob.date.components(separatedBy: "T")[0]
        currentUsersDOB = Date.changeDateFormat(dateString: currentUsersDOB, fromFormat: "yyyy-MM-dd", toFormat: "MM/dd/yyyy")
        dobLabel.text = "DOB: \(currentUsersDOB)"
        phoneNumberLabel.text = "Phone #: \(currentUser.phone)"
        addressLabel.text = "\(currentUser.location.street.capitalized), \(currentUser.location.city.capitalized), \(currentUser.location.state.uppercased())"
    }
}


extension Date {
    static func changeDateFormat(dateString: String, fromFormat: String, toFormat: String) ->String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = fromFormat
        let date = inputDateFormatter.date(from: dateString)
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = toFormat
        return outputDateFormatter.string(from: date!)
    }
}
