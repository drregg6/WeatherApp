//
//  WeatherMainView.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/12/23.
//

import SwiftUI

struct WeatherMainView: View {
    let weather: WeatherDetailModel
    var body: some View {
        HStack {
            Text(weather.description.capitalized)
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.icon)@2x.png"))
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

//struct WeatherMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherMainView()
//    }
//}
