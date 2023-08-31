//
//  CourseModel.swift
//  TuwaiqBoard
//
//  Created by Muhammed on 8/28/23.
//

import Foundation

struct CourseModel: Codable, Identifiable {
    var id: UUID = .init()
//    var content: Optional<String>
//    var attachments: Array<URL>
//    var createdBy: UserModel.ID
//    let createdAt: Date
//    var replies: Array<UserModel.ID>
//    var likes: Array<UserModel.ID>
    
    //var type: String
    
    var name: String
    var location: String
    //var duration: String
    var startDate: Date
    var status: String
    //end date
    
    //description
    
}

struct Course {
    let id: String
    let name: String
    let enrolled: Bool
    var agenda: [AgendaItem]
    var grades: [Grade]
    var announcements: [Announcement]
    
}

struct Student {
    let id: String
    let name: String
    let enrolledCourses: [String]
}

struct AgendaItem {
    let id: String
    let title: String
    let description: String
}

struct Grade {
    let id: String
    let title: String
    let score: Double
}

struct Announcement {
    let id: String
    let title: String
    let content: String
}
