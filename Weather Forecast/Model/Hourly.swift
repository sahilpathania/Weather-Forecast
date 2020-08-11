//
//  Hourly.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 10, 2020

import Foundation

//MARK: - Hourly
struct Hourly : Decodable{

        var clouds : Int?
        var dewPoint : Float?
        var dt : Int?
        var feelsLike : Float?
        var humidity : Int?
        var pop : Float?
        var pressure : Int?
        var rain : Rain?
        var temp : Float?
        var visibility : Int?
        var weather : [Weather]?
        var windDeg : Int?
        var windSpeed : Float?
        
}
