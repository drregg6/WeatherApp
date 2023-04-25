//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import SwiftUI

struct WeatherApp: View {
    @ObservedObject var cityViewModel = CityViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cityViewModel.listOfCities) { city in
                    NavigationLink {
                        WeatherDetail(city: city)
                    } label: {
                        Text(city.name)
                    }
                }
                Group {
                    NavigationLink {
                        WeatherDetail(city: CityModel(name: "Philly", lat: 39.95, lon: -75.145))
                    } label: {
                        Text("Philly")
                    }
                }
                Group {
                    Text("Add a new city")
                }
            }

            .navigationTitle("Cities")
            .listStyle(.grouped)
            .padding()
        }
        .onAppear {
            cityViewModel.fetchCities()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherApp()
    }
}
