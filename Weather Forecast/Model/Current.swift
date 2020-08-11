//
//  Current.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 10, 2020

import Foundation

//MARK: - Current
struct Current : Decodable{
        var clouds : Int?
        var dewPoint : Float?
        var dt : Int?
        var feelsLike : Float?
        var humidity : Int?
        var pressure : Int?
        var sunrise : Int?
        var sunset : Int?
        var temp : Float?
        var uvi : Float?
        var visibility : Int?
        var weather : [Weather]?
        var windDeg : Int?
        var windSpeed : Int?
        
}
