//
//  ApiManager.swift
//  Weather Forecast
//
//  Created by sahil pathania on 10/08/20.
//  Copyright © 2020 sahil pathania. All rights reserved.
//

import Foundation
class ApiManager {
    static let sharedInstance = ApiManager()
    func callWeatherApi(lat : Double , long : Double , success : @escaping(WeatherDataModel) -> () , failure : @escaping(Bool) -> ()) {
        let appID = "3fb9009d355874b5c5ab282580fb0b9f"
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&appid=\(appID)&units=metric"
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in

            // Validation
            guard let data = data, error == nil else {
                print("something went wrong")
                failure(true)
                return
            }
            do {
                let weatherDataModel = try JSONDecoder().decode(WeatherDataModel.self, from: data)
                success(weatherDataModel)
            }
            catch {
                print("error: \(error)")
                failure(true)
            }
        }).resume()
    }
    
    func callReverseGeoCode(lat: Double,long: Double , success : (String) -> ()) {


    }
}
