//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/11/23.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var listOfCities = [CityModel]()
    
    func fetchCities() {
        self.listOfCities = [
            CityModel(name: "Philadelphia"),
            CityModel(name: "Auburn"),
            CityModel(name: "San Francisco")
        ]
    }
    
    func addCity(city: String) {
        self.listOfCities.append(CityModel(name: city))
    }
}
