//
//  MoreView.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 9/3/23.
//

import Foundation
import SwiftUI


struct MoreView: View {
    @State private var selectedSetting = "English"
    @State private var selectedMoods = "Light Mood"
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 130, maxHeight: 130, alignment: .top)
                .foregroundColor(Color(red: 0.3608, green: 0.2157, blue: 0.5882))
            
            Text("Mohammad Almanie")
                .font(.title)
                .foregroundColor(.black)
                .bold()
                .padding(.bottom, 45)
            
            VStack {
                Text("Select Setting: \(selectedSetting)")
                    .font(.headline)
                Picker("Setting Options:", selection: $selectedSetting) {
                    Text("Arabic").tag("Arabic")
                    Text("English").tag("English")
                }
                .pickerStyle(.segmented)
                
                Text("Select Mood: \(selectedMoods)")
                    .font(.headline)
                Picker("Mood Options:", selection: $selectedMoods) {
                    Text("Light Mood").tag("Light Mood")
                    Text("Dark Mood").tag("Dark Mood")
                }
                .pickerStyle(.segmented)
                
            }
            
            Spacer()
            
            Button(action: {
                // Log out action
            }) {
                Text("Log Out")
                    .frame(maxWidth: 250)
                    .padding()
                    .background(Color(red: 0.3608, green: 0.2157, blue: 0.5882))
                    .foregroundColor(.white)
                    .cornerRadius(18)
                    .padding()
            }
            .padding(.bottom, 100)
        }
        .padding()
    }
}


struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
