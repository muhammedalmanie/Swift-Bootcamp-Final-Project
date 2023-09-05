//
//  TabBarView.swift
//  TwaiqBoard
//
//  Created by سكينه النجار on 03/09/2023.
//

import SwiftUI
import FirebaseAuth

struct TabBarView: View {
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        NavigationView {
            TabView {
                Text("LogOut")
                    .onTapGesture {
                        viewModel.signOut()
                    }
                    .tabItem {
                        Label("Home", systemImage: "list.dash")
                    }
                
                Text("My courses")
                    .tabItem {
                        Label("My courses", systemImage: "square.and.pencil")
                    }
            }
            
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
