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
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(city.name)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                MapView(coordinate: CLLocationCoordinate2D(latitude: city.lat, longitude: city.long))
                    .frame(height: 300)
                    .padding(.horizontal)
                Text("Low Temp: 75F")
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Text("High Temp: 95F")
                    .font(.system(size: 20))
                    .padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetail(city: CityModel(name: "Philadelphia", lat: 39.95, long: -75.145))
    }
}
