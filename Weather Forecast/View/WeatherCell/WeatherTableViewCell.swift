//
//  WeatherTableViewCell.swift
//  Weather Forecast
//
//  Created by sahil pathania on 09/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var tempratureLbl: UILabel!
    @IBOutlet weak var descrpitionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with model: [Daily]?, index : Int) {
        let dailyModel = model?[index]
        if let date = dailyModel?.dt {
            dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(date)))
        }
        if let icon = dailyModel?.weather?.first?.icon {
            let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
            weatherImg.imageFromURL(urlString: urlString)
        }
        tempratureLbl.text = "\(String(format: "%.1f", dailyModel?.temp?.day ?? 20))℃"
        descrpitionLbl.text = dailyModel?.weather?.first?.description?.capitalizingFirstLetter()
     }
    static let identifier = "WeatherTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE" // Monday
        return formatter.string(from: inputDate)
    }
    
}


