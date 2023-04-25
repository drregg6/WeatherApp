//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject var cityViewModel: CityViewModel = CityViewModel()
    var body: some Scene {
        WindowGroup {
            WeatherApp()
                .environmentObject(cityViewModel)
        }
    }
}
