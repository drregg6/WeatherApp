//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import SwiftUI

struct WeatherApp: View {
    var cityvm = CityViewModel()
    var body: some View {
        NavigationStack {
            List {
                Group {
                    ForEach(cityvm.listOfCities) { city in
                        NavigationLink {
                            WeatherDetail(city: city)
                        } label: {
                            Text("")
                        }
                    }
                    NavigationLink {
                        WeatherDetail(city: CityModel(name: "Philly", lat: 39.95, long: -75.145))
                    } label: {
                        Text("Philly")
                    }
                }
                .onAppear {
                    cityvm.fetchCities()
                }
                Group {
                    Text("Add a new city")
                }
            }
            .navigationTitle("Cities")
            .listStyle(.grouped)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherApp()
    }
}
