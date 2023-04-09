//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published private(set) var weatherData = [WeatherModel]()
    @Published var hasError = false
    @Published var error: WeatherModelError?
    private let url = "https://api.openweathermap.org/data/2.5/weather?lat=39.953&lon=-75.145&appid=2d63a4b23a06d93bca80d9ad07db98c9"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: self.url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode([WeatherModel]?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = WeatherModelError.decodeError
                    return
                }
                self.weatherData = results
            } catch {
                self.hasError.toggle()
                self.error = WeatherModelError.customError(error: error)
            }
        }
    }
}

extension WeatherViewModel {
    enum WeatherModelError: LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}
