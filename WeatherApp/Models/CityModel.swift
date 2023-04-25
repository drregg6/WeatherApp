//
//  CityModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/11/23.
//

import Foundation

struct CityModel: Identifiable {
    var id: String = UUID().uuidString
    var name: String
}
