
//
//  OnBoardingModel.swift
//  TwaiqBoard
//
//  Created by سكينه النجار on 03/09/2023.
//

import Foundation
struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let img: String
    let primaryText: String
    let secondaryText: String
    
    static let list: [OnboardingData] = [
            OnboardingData(id: 0, img: "person", primaryText: " Welcome to Tuwaiq Board", secondaryText: "You will enjoy to our courses"),
            OnboardingData(id: 1, img: "person", primaryText: "Learning ,discovering, and devlopment your skills with our courses", secondaryText: ""),
            OnboardingData(id: 2, img: "person", primaryText: "You can know and enroll courses inside the App.", secondaryText: "")
          
        ]
}

