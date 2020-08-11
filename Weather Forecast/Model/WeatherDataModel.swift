//
//  WeatherDataModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 10, 2020

import Foundation
//MARK: - WeatherDataModel
struct WeatherDataModel : Decodable{
        var current : Current?
        var daily : [Daily]?
        var hourly : [Hourly]?
        var lat : Float?
        var lon : Float?
        var minutely : [Minutely]?
        var timezone : String?
        var timezoneOffset : Int?
}


