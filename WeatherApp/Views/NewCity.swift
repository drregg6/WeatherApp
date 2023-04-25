//
//  NewCity.swift
//  WeatherApp
//
//  Created by Dave Regg on 4/25/23.
//

import SwiftUI

struct NewCity: View {
    @StateObject var cityViewModel = CityViewModel()
    @State var textField: String = ""
    
    var body: some View {
        VStack {
            TextField("New City", text: $textField)
                .font(.system(size: 24))
                .frame(height: 55)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            Button(action: saveButtonPressed, label: {
                Text("Save".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
        }
        .padding()
    }
    
    func saveButtonPressed() {
        
    }
}

struct NewCity_Previews: PreviewProvider {
    static var previews: some View {
        NewCity()
            .environmentObject(CityViewModel())
    }
}
