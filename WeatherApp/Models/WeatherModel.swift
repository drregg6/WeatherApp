//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import Foundation

struct WeatherResults: Codable {
    let WeatherResults: [WeatherModel]
}

struct WeatherModel: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let name: String
    let coord: CoordinateModel
    let weather: [WeatherDetailModel]
    let main: WeatherMainModel
    let dt: Int
}
