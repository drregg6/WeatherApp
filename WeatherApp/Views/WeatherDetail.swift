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
                    Text(city.name)
                        .font(.system(size: 20))
                        .padding(.horizontal)
                    MapView(coordinate: CLLocationCoordinate2D(latitude: city.lat, longitude: city.long))
                        .frame(height: 300)
                        .padding(.horizontal)
                    TempMainView(weather: weather.main)
                } else {
                    Text("Loading...")
                }
            }
            .padding(.horizontal)
        }
        .task {
            await weathervm.fetchData(lat: city.lat, long: city.long)
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
