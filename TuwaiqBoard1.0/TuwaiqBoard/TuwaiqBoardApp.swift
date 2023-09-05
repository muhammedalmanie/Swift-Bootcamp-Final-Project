//
//  TuwaiqBoardApp.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 8/27/23.
//

import SwiftUI
import FirebaseCore

@main
struct TuwaiqBoardApp: App {
    
    
    init () {
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
