//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/11/23.
//

import Foundation

class CityViewModel {
    private(set) var listOfCities = [CityModel]()
    
    func fetchCities() {
        self.listOfCities = [
            CityModel(name: "Philadelphia", lat: 39.95, lon: -75.145),
            CityModel(name: "Auburn", lat: 32.609, lon: -85.48),
            CityModel(name: "San Francisco", lat: 37.773, lon: -122.431)
        ]
        print(listOfCities)
    }
}
