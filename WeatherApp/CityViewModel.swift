//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/11/23.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var cities: [CityModel]
    
    init() {
        if let cityData = UserDefaults.standard.data(forKey: "data") {
            if let decoded = try? JSONDecoder().decode([CityModel].self, from: cityData) {
                cities = decoded
                return
            }
        }
        
        cities = [
            CityModel(name: "Philadelphia"),
            CityModel(name: "Auburn"),
            CityModel(name: "San Francisco")
        ]
    }
    
    func addCity(name: String) {
        let newCity = CityModel(name: name)
        print(newCity)
        cities.append(newCity)
        save()
        print(cities)
    }
    
    func deleteCity(indexSet: IndexSet) {
        cities.remove(atOffsets: indexSet)
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(cities) {
            UserDefaults.standard.set(encoded, forKey: "data")
        }
    }
}

//    func fetchCities() -> [CityModel] {
//        let newCities =
//        cities.append(contentsOf: newCities)
//        let defaultObject = CityModel(name: "Philadelphia")
//        if let objects = UserDefaults.standard.value(forKey: "cities") as? Data {
//             let decoder = JSONDecoder()
//             if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [CityModel] {
//                return objectsDecoded
//             } else {
//                return [defaultObject]
//             }
//          } else {
//             return [defaultObject]
//          }
//    }
