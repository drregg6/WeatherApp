//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/11/23.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var cities = [CityModel]()
    
    init() {
        fetchCities()
    }
    
    func fetchCities() {
        self.cities = [
            CityModel(name: "Philadelphia"),
            CityModel(name: "Auburn"),
            CityModel(name: "San Francisco")
        ]
    }
    
    func addCity(name: String) {
        let newCity = CityModel(name: name)
        cities.append(newCity)
    }
    
    func deleteCity(indexSet: IndexSet) {
        cities.remove(atOffsets: indexSet)
    }
}
