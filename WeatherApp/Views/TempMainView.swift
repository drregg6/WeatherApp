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
        VStack {
            Text("Currently: \(Int(weather.temp))°F")
                .font(.system(size: 20))
            Text("Low: \(Int(weather.temp_min))°F")
                .font(.system(size: 14))
            Text("High: \(Int(weather.temp_max))°F")
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal)
    }
}

//struct TempMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        TempMainView()
//    }
//}
