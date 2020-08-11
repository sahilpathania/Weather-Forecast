//
//  Daily.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 10, 2020

import Foundation

//MARK: - Daily
struct Daily : Decodable{

        var clouds : Int?
        var dewPoint : Float?
        var dt : Int?
        var feelsLike : FeelsLike?
        var humidity : Int?
        var pop : Double?
        var pressure : Int?
        var rain : Float?
        var sunrise : Int?
        var sunset : Int?
        var temp : Temp?
        var uvi : Float?
        var weather : [Weather]?
        var windDeg : Int?
        var windSpeed : Float?
        
}
