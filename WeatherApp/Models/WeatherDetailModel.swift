//
//  WeatherDetailModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import Foundation

struct WeatherDetailModel: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let main: String
    let description: String
    let icon: String
}
