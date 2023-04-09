//
//  ContentView.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/9/23.
//

import SwiftUI

struct WeatherApp: View {
    var body: some View {
        NavigationStack {
            List { // This will be a list of sample cities
                NavigationLink {
                    WeatherDetail()
                } label: {
                    Text("Auburn")
                }
                NavigationLink {
                    WeatherDetail()
                } label: {
                    Text("Philadelphia")
                }
            }
            .listStyle(.grouped)
            .padding()
            List { // Add a new city
                Text("Add a new city")
            }
            .listStyle(.grouped)
            .padding()
        }
//        .task {
//            await hogwartsvm.fetchData()
//        }
        .navigationTitle("Hogwarts Houses")
//        .alert(isPresented: $hogwartsvm.hasError, error: hogwartsvm.error) {
//            Text("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherApp()
    }
}
