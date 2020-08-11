//
//  CurrentTimeTableViewCell.swift
//  Weather Forecast
//
//  Created by sahil pathania on 10/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentTimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var placeNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: WeatherDataModel?) {
        guard  let model = model else { return }
        let geoCoder = CLGeocoder()
        if let lat = (model.lat) , let long = (model.lon) {
            let location = CLLocation(latitude: CLLocationDegrees(lat) , longitude: CLLocationDegrees(long))
        geoCoder.reverseGeocodeLocation(location, completionHandler: { [weak self] (placemarks, error) -> Void in
            let placeMark = placemarks?[0]
            self?.placeNameLbl.text = "\(placeMark?.locality ?? ""), \(placeMark?.country ?? "India")"
        })
        }
        descriptionLbl.text = model.current?.weather?.first?.description?.capitalizingFirstLetter()
        temperatureLbl.text = "\(String(format: "%0.1f", model.current?.temp ?? 20))℃"
    }
    
    
    static let identifier = "CurrentTimeTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CurrentTimeTableViewCell", bundle: nil)
    }
}
