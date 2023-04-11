//
//  CityModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/11/23.
//

import Foundation

struct CityModel: Identifiable {
    var id: UUID {
        return UUID()
    }
    let name: String
    let lat: Double
    let long: Double
}
