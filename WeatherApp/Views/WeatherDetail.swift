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
            ZStack {
                if let weather = weathervm.weatherData {
                    Image(weather.weather[0].main.lowercased())
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    VStack {
                        Text(city.name)
                            .font(.system(size: 64))
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                        TempMainView(weather: weather.main)
                        WeatherMainView(weather: weather.weather[0])
                        MapView(coordinate: CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon))
                            .frame(height: 300)
                            .clipShape(Circle())
                    }
                } else {
                    ProgressView()
                }
            }
        }
        .task {
            await weathervm.fetchData(lat: city.coord.lat, long: city.coord.lon)
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

//Image(banner)
//    .frame(width: 250, height: 250, alignment: .center)
//    .aspectRatio(contentMode: .fill)
