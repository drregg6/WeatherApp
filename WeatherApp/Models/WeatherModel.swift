//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import Foundation

struct WeatherModel: Codable {
    let name: String
    let coord: CoordinateModel
    let weather: [WeatherDetailModel]
    let main: WeatherMainModel
}
