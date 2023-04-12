//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import SwiftUI
import MapKit

struct WeatherDetail: View {
    let city: CityModel
    @ObservedObject var weathervm = WeatherViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let weather = weathervm.weatherData {
                    MapView(coordinate: CLLocationCoordinate2D(latitude: city.lat, longitude: city.lon))
                        .frame(height: 300)
                        //.padding(.horizontal)
                    Text(city.name)
                        .font(.largeTitle)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .center)
                    WeatherMainView(weather: weather.weather[0])
                    TempMainView(weather: weather.main)
                } else {
                    ProgressView()
                }
            }
            .padding(.horizontal)
        }
        .task {
            await weathervm.fetchData(lat: city.lat, long: city.lon)
        }
        .alert(isPresented: $weathervm.hasError, error: weathervm.error) {
            Text("")
        }
    }
}

//struct WeatherDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetail(city: CityModel(name: "Philadelphia", lat: 39.95, long: -75.145))
//    }
//}
