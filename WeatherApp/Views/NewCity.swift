//
//  NewCity.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/25/23.
//

import SwiftUI

struct NewCity: View {
    @State var newCity = ""
    @StateObject var cityViewModel = CityViewModel()
    
    var body: some View {
        VStack {
            TextField("New City", text: $newCity)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    cityViewModel.addCity(city: newCity)
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct NewCity_Previews: PreviewProvider {
    static var previews: some View {
        NewCity()
    }
}
