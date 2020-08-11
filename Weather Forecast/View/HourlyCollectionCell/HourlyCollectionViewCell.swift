//
//  HourlyCollectionViewCell.swift
//  Weather Forecast
//
//  Created by sahil pathania on 10/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit
import CoreLocation

class HourlyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLbl: UILabel!    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var temperatureLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: [Hourly]? , index : Int) {
        guard let model = model else {return}
        let currentModel = model[index]
        if let date = currentModel.dt {
            let date = Date(timeIntervalSince1970: Double(date))
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            timeLbl.text = formatter.string(from: date)
        }
        if let icon = currentModel.weather?.first?.icon {
            let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
            weatherImg.imageFromURL(urlString: urlString)
        }
        temperatureLbl.text = "\(String(format: "%0.1f", currentModel.temp ?? 20))℃"
    }
    static let identifier = "HourlyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HourlyCollectionViewCell", bundle: nil)
    }
}
