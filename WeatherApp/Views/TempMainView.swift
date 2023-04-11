//
//  TempMainView.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/11/23.
//

import SwiftUI

struct TempMainView: View {
    let weather: WeatherMainModel
    var body: some View {
        Text("Current Temp: \(weather.temp)")
            .font(.system(size: 20))
            .padding(.horizontal)
        Text("Low Temp: \(weather.temp_min)")
            .font(.system(size: 20))
            .padding(.horizontal)
        Text("High Temp: \(weather.temp_max)")
            .font(.system(size: 20))
            .padding(.horizontal)
    }
}

//struct TempMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        TempMainView()
//    }
//}
