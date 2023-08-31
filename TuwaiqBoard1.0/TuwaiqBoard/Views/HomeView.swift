//
//  HomeView.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 8/31/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

struct HomeView: View {

    
    var body: some View {
        VStack{
            
            HStack {
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(Color(red: 0.3608, green: 0.2157, blue: 0.5882))
                    .font(.title)
                    .padding()
            }
         
            

        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
