//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/11/23.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var cities: [CityModel] = []
    
    init() {
        fetchCities()
        print(cities)
    }
    
    func fetchCities() {
        let newCities = [
            CityModel(name: "Philadelphia"),
            CityModel(name: "Auburn"),
            CityModel(name: "San Francisco")
        ]
        cities.append(contentsOf: newCities)
    }
    
    func addCity(name: String) {
        let newCity = CityModel(name: name)
        cities.append(newCity)
    }
    
    func deleteCity(indexSet: IndexSet) {
        cities.remove(atOffsets: indexSet)
    }
}
