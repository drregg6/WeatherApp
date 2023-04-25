//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import SwiftUI

struct WeatherApp: View {
    var cityViewModel = CityViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    ForEach(cityViewModel.listOfCities) { city in
                        NavigationLink {
                            WeatherDetail(city: city)
                        } label: {
                            Text(city.name)
                        }
                    }
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
            .onAppear {
                cityViewModel.fetchCities()
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
