//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherModel?
    @Published var hasError = false
    @Published var error: WeatherModelError?
    private var url: String = ""
    
    func buildUrl(lat: Double, long: Double) {
        self.url = "https://api.openweathermap.org/data/2.5/weather?"
        self.url += "lat=\(lat)&lon=\(long)"

        var keys: NSDictionary?
        var apiKey: String = ""

        if let path = Bundle.main.path(forResource: "keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        if let dict = keys {
            apiKey = (dict["apiKey"] as? String)!
        }

        self.url += "&appid=\(apiKey)"
    }
    
//    @MainActor
//    func fetchData(lat: Double, long: Double) async {
//        do {
//            buildUrl(lat: lat, long: long)
//            guard let url = URL(string: self.url) else { fatalError("Missing URL") }
//
//            let urlRequest = URLRequest(url: url)
//
//            let (data, response) = try await URLSession.shared.data(for: urlRequest)
//
//            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
//
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let decodedData = try decoder.decode(WeatherModel.self, from: data)
//
//            DispatchQueue.main.async {
//                self.weatherData = decodedData
//            }
//        } catch {
//            self.hasError.toggle()
//            self.error = WeatherModelError.customError(error: error)
//        }
//    }
    
    @MainActor
    func fetchData(lat: Double, long: Double) async {
        buildUrl(lat: lat, long: long)
        if let url = URL(string: self.url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(WeatherModel?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = WeatherModelError.decodeError
                    return
                }
                print(results)
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
