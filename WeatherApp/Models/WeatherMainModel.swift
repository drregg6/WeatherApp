//
//  WeatherMainModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import Foundation

struct WeatherMainModel: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}
