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
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.icon).png"))
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            Text("\(weather.main.capitalized): \(weather.description.capitalized)")
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

//struct WeatherMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherMainView()
//    }
//}
//
