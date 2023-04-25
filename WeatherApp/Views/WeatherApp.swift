//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import SwiftUI

struct WeatherApp: View {
    @EnvironmentObject var cityViewModel: CityViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cityViewModel.cities) { city in
                    NavigationLink {
                        WeatherDetail(city: city)
                    } label: {
                        Text(city.name)
                    }
                }
                .onDelete(perform: cityViewModel.deleteCity)
                Section {
                    NavigationLink {
                        NewCity()
                    } label: {
                        Text("Add a new city")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                    }
                }
            }

            .navigationTitle("Cities")
            .listStyle(.grouped)
            .padding()
        }
//        .onAppear {
//            cityViewModel.fetchCities()
//        }
        .refreshable {
            cityViewModel.fetchCities()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherApp()
            .environmentObject(CityViewModel())
    }
}
