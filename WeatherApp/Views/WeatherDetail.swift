//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import SwiftUI
import MapKit

struct WeatherDetail: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("City Name")
                    .font(.system(size: 20))
                    .padding(.horizontal)
                MapView(coordinate: CLLocationCoordinate2D(latitude: 39.953, longitude: 75.145))
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
        WeatherDetail()
    }
}
